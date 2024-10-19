{{
    config(materialized = 'view')
}}
SELECT
    _FILE,
    _LINE,
    _MODIFIED,
    _FIVETRAN_SYNCED,
    PATIENT_ID,
    MEDICATION_TYPE,
    DOSAGE,
    START_DATE,
    END_DATE
FROM
    {{source('raw_json','medications')}}