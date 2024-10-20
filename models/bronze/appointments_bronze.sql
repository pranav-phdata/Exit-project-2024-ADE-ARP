{{ config(
    materialized='table',
    alias='appointments'
) }}

SELECT
    APPOINTMENTID AS APPOINTMENT_ID,
    PATIENTID AS PATIENT_ID,
    cast(APPOINTMENTTIME as TIME) as APPOINTMENT_TIME,  -- Cast AppointmentTime to TIME
    cast(APPOINTMENTDATE as DATE) as APPOINTMENT_DATE   -- Cast AppointmentDate to DATE
FROM 
    {{ source('sql_server', 'appointments') }}
