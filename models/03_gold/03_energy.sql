{{ config(
    materialized='table',
    schema='03_gold',
    alias='energy'
) }}
SELECT
    c.year,
    c.state,
    c.type_of_producer,
    c.energy_source,
    c.consumption_electricity,
    g.generation_megawatthours
FROM {{ ref('02_consumption') }} c
LEFT JOIN {{ ref('02_generation') }} g
    ON  c.year  = g.year
    AND c.state = g.state
WHERE c.state != 'US-TOTAL'
AND NOT (
    c.consumption_electricity IS NULL
    AND g.generation_megawatthours IS NULL
)
