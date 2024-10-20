
{{config(
    materialized='table',
    alias="medical_data"
)}}

SELECT
    PATIENT_ID as PATIENT_ID,
    TEST_TYPE as TEST_TYPE,
    cast(TEST_DATE as DATE) as TEST_DATE,
    TEST_RESULT as TEST_RESULT
FROM 
    {{ source('raw_csv', 'medical_data') }}
