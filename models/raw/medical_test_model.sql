-- models/raw_medical_data.sql

{{ config(
    materialized='view'
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
    {{ source('raw', 'medical_data') }}
