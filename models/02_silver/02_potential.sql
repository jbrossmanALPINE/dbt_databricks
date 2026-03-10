{{ config(
    materialized='table',
    schema='02_silver',
    alias='potential'
) }}
SELECT
    TRIM(State)                                             AS state,
    CAST(Urban_Utility_scale_PV_GWh AS DOUBLE)             AS urban_utility_scale_pv_gwh,
    CAST(Urban_Utility_scale_PV_GW AS DOUBLE)              AS urban_utility_scale_pv_gw,
    CAST(Urban_Utility_scale_PV_km2 AS DOUBLE)             AS urban_utility_scale_pv_km2,
    CAST(Rural_Utility_scale_PV_GWh AS DOUBLE)             AS rural_utility_scale_pv_gwh,
    CAST(Rural_Utility_scale_PV_GW AS DOUBLE)              AS rural_utility_scale_pv_gw,
    CAST(Rural_Utility_scale_PV_km2 AS DOUBLE)             AS rural_utility_scale_pv_km2,
    CAST(Rooftop_PV_GWh AS DOUBLE)                         AS rooftop_pv_gwh,
    CAST(Rooftop_PV_GW AS DOUBLE)                          AS rooftop_pv_gw,
    CAST(CSP_GWh AS DOUBLE)                                AS csp_gwh,
    CAST(CSP_GW AS DOUBLE)                                 AS csp_gw,
    CAST(CSP_km2 AS DOUBLE)                                AS csp_km2,
    CAST(Onshore_Wind_GWh AS DOUBLE)                       AS onshore_wind_gwh,
    CAST(Onshore_Wind_GW AS DOUBLE)                        AS onshore_wind_gw,
    CAST(Onshore_Wind_km2 AS DOUBLE)                       AS onshore_wind_km2,
    CAST(Offshore_Wind_GWh AS DOUBLE)                      AS offshore_wind_gwh,
    CAST(Offshore_Wind_GW AS DOUBLE)                       AS offshore_wind_gw,
    CAST(Offshore_Wind_km2 AS DOUBLE)                      AS offshore_wind_km2,
    CAST(Biopower_Solid_GWh AS DOUBLE)                     AS biopower_solid_gwh,
    CAST(Biopower_Solid_GW AS DOUBLE)                      AS biopower_solid_gw,
    CAST(Biopower_Solid_BDT AS DOUBLE)                     AS biopower_solid_bdt,
    CAST(Biopower_Gaseous_GWh AS DOUBLE)                   AS biopower_gaseous_gwh,
    CAST(Biopower_Gaseous_GW AS DOUBLE)                    AS biopower_gaseous_gw,
    CAST(Biopower_Gaseous_Tonnes_CH4 AS DOUBLE)            AS biopower_gaseous_tonnes_ch4,
    CAST(Geothermal_Hydrothermal_GWh AS DOUBLE)            AS geothermal_hydrothermal_gwh,
    CAST(Geothermal_Hydrothermal_GW AS DOUBLE)             AS geothermal_hydrothermal_gw,
    CAST(EGS_Geothermal_GWh AS DOUBLE)                     AS egs_geothermal_gwh,
    CAST(EGS_Geothermal_GW AS DOUBLE)                      AS egs_geothermal_gw,
    CAST(Hydropower_GWh AS DOUBLE)                         AS hydropower_gwh,
    CAST(Hydropower_GW AS DOUBLE)                          AS hydropower_gw,
    CAST(Hydropower_Count_of_Sites AS INT)                 AS hydropower_count_of_sites
FROM {{ ref('01_potential') }}
WHERE TRIM(State) != '.'
