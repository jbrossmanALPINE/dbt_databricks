{{ config(
    materialized='table',
    schema='02_silver',
    alias='consumption'
) }}
SELECT
    CAST(TRIM(YEAR) AS INT)                                         AS year,
    TRIM(STATE)                                                     AS state,
    TRIM(TYPE_OF_PRODUCER)                                          AS type_of_producer,
    TRIM(ENERGY_SOURCE)                                             AS energy_source,
    NULLIF(CAST(regexp_replace(TRIM(CONSUMPTION_ELECTRICITY), ',', '') AS DOUBLE), 0)          AS consumption_electricity
FROM {{ ref('01_consumption') }}
WHERE TRIM(CONSUMPTION_ELECTRICITY) != '.'

