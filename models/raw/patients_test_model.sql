{{ config(
    materialized='table',
    post_hook = [
        "ALTER TABLE patients ADD PRIMARY KEY (PATIENTID)"
    ]
) }}

SELECT
    PATIENTID,
    NAME,
    DATEOFBIRTH,
    POSTALCODE
FROM 
    {{ source('sql_server', 'patients') }}