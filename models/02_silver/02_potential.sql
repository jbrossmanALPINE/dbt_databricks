{{ config(
    materialized='table',
    schema='02_silver',
    alias='potential'
) }}
SELECT
    TRIM(State)                                             AS state,
    TRY_CAST(Urban_Utility_scale_PV_GWh AS DOUBLE)         AS urban_utility_scale_pv_gwh,
    TRY_CAST(Urban_Utility_scale_PV_GW AS DOUBLE)          AS urban_utility_scale_pv_gw,
    TRY_CAST(Urban_Utility_scale_PV_km2 AS DOUBLE)         AS urban_utility_scale_pv_km2,
    TRY_CAST(Rural_Utility_scale_PV_GWh AS DOUBLE)         AS rural_utility_scale_pv_gwh,
    TRY_CAST(Rural_Utility_scale_PV_GW AS DOUBLE)          AS rural_utility_scale_pv_gw,
    TRY_CAST(Rural_Utility_scale_PV_km2 AS DOUBLE)         AS rural_utility_scale_pv_km2,
    TRY_CAST(Rooftop_PV_GWh AS DOUBLE)                     AS rooftop_pv_gwh,
    TRY_CAST(Rooftop_PV_GW AS DOUBLE)                      AS rooftop_pv_gw,
    TRY_CAST(CSP_GWh AS DOUBLE)                            AS csp_gwh,
    TRY_CAST(CSP_GW AS DOUBLE)                             AS csp_gw,
    TRY_CAST(CSP_km2 AS DOUBLE)                            AS csp_km2,
    TRY_CAST(Onshore_Wind_GWh AS DOUBLE)                   AS onshore_wind_gwh,
    TRY_CAST(Onshore_Wind_GW AS DOUBLE)                    AS onshore_wind_gw,
    TRY_CAST(Onshore_Wind_km2 AS DOUBLE)                   AS onshore_wind_km2,
    TRY_CAST(Offshore_Wind_GWh AS DOUBLE)                  AS offshore_wind_gwh,
    TRY_CAST(Offshore_Wind_GW AS DOUBLE)                   AS offshore_wind_gw,
    TRY_CAST(Offshore_Wind_km2 AS DOUBLE)                  AS offshore_wind_km2,
    TRY_CAST(Biopower_Solid_GWh AS DOUBLE)                 AS biopower_solid_gwh,
    TRY_CAST(Biopower_Solid_GW AS DOUBLE)                  AS biopower_solid_gw,
    TRY_CAST(Biopower_Solid_BDT AS DOUBLE)                 AS biopower_solid_bdt,
    TRY_CAST(Biopower_Gaseous_GWh AS DOUBLE)               AS biopower_gaseous_gwh,
    TRY_CAST(Biopower_Gaseous_GW AS DOUBLE)                AS biopower_gaseous_gw,
    TRY_CAST(Biopower_Gaseous_Tonnes_CH4 AS DOUBLE)        AS biopower_gaseous_tonnes_ch4,
    TRY_CAST(Geothermal_Hydrothermal_GWh AS DOUBLE)        AS geothermal_hydrothermal_gwh,
    TRY_CAST(Geothermal_Hydrothermal_GW AS DOUBLE)         AS geothermal_hydrothermal_gw,
    TRY_CAST(EGS_Geothermal_GWh AS DOUBLE)                 AS egs_geothermal_gwh,
    TRY_CAST(EGS_Geothermal_GW AS DOUBLE)                  AS egs_geothermal_gw,
    TRY_CAST(Hydropower_GWh AS DOUBLE)                     AS hydropower_gwh,
    TRY_CAST(Hydropower_GW AS DOUBLE)                      AS hydropower_gw,
    TRY_CAST(Hydropower_Count_of_Sites AS INT)             AS hydropower_count_of_sites
FROM {{ ref('01_potential') }}
WHERE TRIM(State) != '.'
