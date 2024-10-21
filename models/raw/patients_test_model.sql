{{ config(
    materialized='table'
) }}

SELECT
    PATIENTID,
    NAME,
    DATEOFBIRTH,
    POSTALCODE
FROM 
    {{ source('sql_server', 'patients') }}