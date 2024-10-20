{{ config(
    materialized='table',
    post_hook = [
        "ALTER TABLE APPOINTMENTS ADD PRIMARY KEY (APPOINTMENTID)",
        "ALTER TABLE APPOINTMENTS
        ADD CONSTRAINT fk_patient_id
        FOREIGN KEY (PATIENTID)
        REFERENCES patients(PATIENTID)"
    ]
) }}

SELECT
    APPOINTMENTID,
    PATIENTID,
    APPOINTMENTTIME,
    APPOINTMENTDATE
FROM 
    {{ source('sql_server', 'appointments') }}