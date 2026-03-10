{{ config(
    materialized='table',
    schema='01_bronze',
    alias='population'
) }}
SELECT
    Location,
    `2019`,
    `2020`,
    `2021`,
    `2022`,
    `2023`,
    `2024`,
    `2025`
FROM read_files(
    '/Volumes/dbt_energy/00_ingestion/csv/population_estimates.csv',
    format => 'csv',
    header => true
)
