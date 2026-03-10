{{ config(
    materialized='table',
    schema='01_bronze',
    alias='generation'
) }}
SELECT
    YEAR,
    STATE,
    TYPE_OF_PRODUCER,
    ENERGY_SOURCE,
    GENERATION_Megawatthours
FROM read_files(
    '/Volumes/dbt_energy/00_ingestion/csv/annual_generation_state.csv',
    format => 'csv',
    header => true
)
