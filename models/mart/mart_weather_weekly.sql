SELECT 
    airport_code,
    DATE_TRUNC('week', date) as week_start_date, 
    AVG(avg_temp_c) AS avg_weekly_temp_c, 
    MIN(min_temp_c) AS min_weekly_temp_c, 
    MAX(max_temp_c) AS max_weekly_temp_c,  
    SUM(precipitation_mm) AS sum_weekly_precipitation_mm,
    MAX(max_snow_mm) AS max_weekly_snow_mm, 
    AVG(avg_wind_direction) AS avg_weekly_wind_direction, 
    MAX(wind_peakgust_kmh) AS max_weekly_wind_peakgust_kmh, 
    AVG(avg_pressure_hpa) AS avg_weekly_pressure_hpa, 
    SUM(sun_minutes) AS sum_weekly_sun_minutes 
FROM 
    {{ ref('prep_weather_daily') }}
GROUP BY 
    airport_code,
    DATE_TRUNC('week', date)
ORDER BY 
    airport_code,
    week_start_date
