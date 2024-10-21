{{config(
    materialized = 'table',
    alias="medications"
)}}

SELECT
    PATIENT_ID AS PATIENT_ID,
    MEDICATION_TYPE AS MEDICATION_TYPE,
    DOSAGE,
    CAST(START_DATE AS DATE) as START_DATE,
    CAST(END_DATE AS DATE) as END_DATE
FROM
    {{source('raw_json','medications')}}