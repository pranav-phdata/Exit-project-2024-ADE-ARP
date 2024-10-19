-- models/raw_medical_data.sql

{{ config(
    materialized='table'
) }}

SELECT
    PATIENT_ID as PATIENTID,
    TEST_TYPE as TESTTYPE,
    TEST_DATE as TESTDATE,
    TEST_RESULT as TESTRESULT
FROM 
    {{ source('raw_csv', 'medical_data') }}
