{{
    config(materialized = 'table')
}}
SELECT
    PATIENT_ID as PATIENTID,
    MEDICATION_TYPE AS MEDICATIONTYPE,
    DOSAGE,
    START_DATE as STARTDATE,
    END_DATE as ENDDATE
FROM
    {{source('raw_json','medications')}}