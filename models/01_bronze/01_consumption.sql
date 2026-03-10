{{ config(
    materialized='table',
    schema='01_bronze',
    alias='consumption'
) }}
SELECT
    YEAR,
    STATE,
    TYPE_OF_PRODUCER,
    ENERGY_SOURCE,
    CONSUMPTION_ELECTRICITY
FROM read_files(
    '/Volumes/dbt_energy/00_ingestion/csv/annual_consumption_state.csv',
    format => 'csv',
    header => true
)
