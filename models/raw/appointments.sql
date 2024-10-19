{{ config(
    materialized='table'
) }}

SELECT
    APPOINTMENTID,
    PATIENTID,
    cast(APPOINTMENTTIME as TIME) as APPOINTMENTTIME,
    APPOINTMENTDATE
FROM 
    {{ source('sql_server', 'appointments') }}