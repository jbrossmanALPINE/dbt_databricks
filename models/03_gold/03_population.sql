{{ config(
    materialized='table',
    schema='03_gold',
    alias='population'
) }}
SELECT
    state,
    population,
    year
FROM {{ ref('02_population') }}
WHERE state != 'United States'
AND state != 'District of Columbia'
AND state != 'Puerto Rico'
AND state != 'US-TOTAL'
