{{ config(
    materialized='table'
) }}

SELECT
    APPOINTMENTID,
    PATIENTID,
    APPOINTMENTTIME,
    APPOINTMENTDATE
FROM 
    {{ source('sql_server', 'appointments') }}