{{ config(
    materialized='table',
    schema='02_silver',
    alias='population'
) }}
SELECT TRIM(Location) AS state, CAST(`2019` AS INT) AS population, 2019 AS year FROM {{ ref('01_population') }} WHERE TRIM(Location) != '.'
UNION ALL
SELECT TRIM(Location) AS state, CAST(`2020` AS INT) AS population, 2020 AS year FROM {{ ref('01_population') }} WHERE TRIM(Location) != '.'
UNION ALL
SELECT TRIM(Location) AS state, CAST(`2021` AS INT) AS population, 2021 AS year FROM {{ ref('01_population') }} WHERE TRIM(Location) != '.'
UNION ALL
SELECT TRIM(Location) AS state, CAST(`2022` AS INT) AS population, 2022 AS year FROM {{ ref('01_population') }} WHERE TRIM(Location) != '.'
UNION ALL
SELECT TRIM(Location) AS state, CAST(`2023` AS INT) AS population, 2023 AS year FROM {{ ref('01_population') }} WHERE TRIM(Location) != '.'
UNION ALL
SELECT TRIM(Location) AS state, CAST(`2024` AS INT) AS population, 2024 AS year FROM {{ ref('01_population') }} WHERE TRIM(Location) != '.'
UNION ALL
SELECT TRIM(Location) AS state, CAST(`2025` AS INT) AS population, 2025 AS year FROM {{ ref('01_population') }} WHERE TRIM(Location) != '.'
