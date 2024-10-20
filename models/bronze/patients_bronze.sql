{{ config(
    materialized='table',
    alias='patients'
) }}


SELECT
    PATIENTID AS PATIENT_ID,
    NAME,
    cast(DATEOFBIRTH AS DATE) AS DATE_OF_BIRTH,
    POSTALCODE AS POSTAL_CODE
FROM 
    {{ source('sql_server', 'patients') }}