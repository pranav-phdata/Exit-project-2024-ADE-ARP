-- master_table_gold.sql
{{config(
    materialized="view",
    alias="master_table"
)}}

SELECT
    p.PATIENT_ID,
    p.NAME,
    p.DATE_OF_BIRTH,
    p.POSTAL_CODE,
    a.APPOINTMENT_ID,
    a.APPOINTMENT_DATE,
    a.APPOINTMENT_TIME,
    md.TEST_TYPE,
    md.TEST_DATE,
    md.TEST_RESULT,
    m.MEDICATION_TYPE,
    m.DOSAGE,
    m.START_DATE AS MEDICATION_START_DATE,
    m.END_DATE AS MEDICATION_END_DATE
FROM {{ ref('patients_bronze') }} p
LEFT JOIN {{ ref('appointments_bronze') }} a
    ON p.PATIENT_ID = a.PATIENT_ID
LEFT JOIN {{ ref('medical_data_bronze') }} md
    ON p.PATIENT_ID = md.PATIENT_ID
LEFT JOIN {{ ref('medications_bronze') }} m
    ON p.PATIENT_ID = m.PATIENT_ID
