-- models/raw_medical_data.sql

{{ config(
    materialized='table',
    post_hook = [
        "ALTER TABLE MEDICAL_DATA
        ADD CONSTRAINT fk_patient_id
        FOREIGN KEY (PATIENTID)
        REFERENCES patients(PATIENTID)"
    ]
) }}

SELECT
    _FILE,
    _LINE,
    _MODIFIED,
    _FIVETRAN_SYNCED,
    PATIENT_ID,
    TEST_TYPE,
    TEST_DATE,
    TEST_RESULT
FROM 
    {{ source('raw_csv', 'medical_data') }}