{{ config(
    materialized='table',
    schema='03_gold',
    alias='potential'
) }}
SELECT
    state,
    urban_utility_scale_pv_gwh,
    urban_utility_scale_pv_km2,
    rural_utility_scale_pv_gwh,
    rural_utility_scale_pv_km2,
    rooftop_pv_gwh,
    onshore_wind_gwh,
    onshore_wind_km2,
    offshore_wind_gwh,
    offshore_wind_km2,
    geothermal_hydrothermal_gwh,
    hydropower_gwh,
    hydropower_count_of_sites
FROM {{ ref('02_potential') }}
