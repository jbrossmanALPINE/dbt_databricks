{{ config(
    materialized='table',
    schema='02_silver',
    alias='generation'
) }}
SELECT
    CAST(TRIM(YEAR) AS INT)                                         AS year,
    TRIM(STATE)                                                     AS state,
    TRIM(TYPE_OF_PRODUCER)                                          AS type_of_producer,
    TRIM(ENERGY_SOURCE)                                             AS energy_source,
    NULLIF(CAST(regexp_replace(TRIM(GENERATION_Megawatthours), ',', '') AS DOUBLE), 0)      AS generation_megawatthours
FROM {{ ref('01_generation') }}
WHERE TRIM(GENERATION_Megawatthours) != '.'