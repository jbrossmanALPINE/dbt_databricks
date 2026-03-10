{{ config(
    materialized='table',
    schema='01_bronze',
    alias='potential'
) }}
SELECT
    State,
    Urban_Utility_scale_PV_GWh,
    Urban_Utility_scale_PV_GW,
    Urban_Utility_scale_PV_km2,
    Rural_Utility_scale_PV_GWh,
    Rural_Utility_scale_PV_GW,
    Rural_Utility_scale_PV_km2,
    Rooftop_PV_GWh,
    Rooftop_PV_GW,
    CSP_GWh,
    CSP_GW,
    CSP_km2,
    Onshore_Wind_GWh,
    Onshore_Wind_GW,
    Onshore_Wind_km2,
    Offshore_Wind_GWh,
    Offshore_Wind_GW,
    Offshore_Wind_km2,
    Biopower_Solid_GWh,
    Biopower_Solid_GW,
    Biopower_Solid_BDT,
    Biopower_Gaseous_GWh,
    Biopower_Gaseous_GW,
    Biopower_Gaseous_Tonnes_CH4,
    Geothermal_Hydrothermal_GWh,
    Geothermal_Hydrothermal_GW,
    EGS_Geothermal_GWh,
    EGS_Geothermal_GW,
    Hydropower_GWh,
    Hydropower_GW,
    Hydropower_Count_of_Sites
FROM read_files(
    '/Volumes/dbt_energy/00_ingestion/csv/technical_potential.csv',
    format => 'csv',
    header => true
)
