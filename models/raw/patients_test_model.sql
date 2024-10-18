{{ config(
    materialized='view'
) }}

SELECT
    PATIENTID,
    NAME,
    DATEOFBIRTH,
    POSTALCODE
FROM 
    {{ source('sql_server', 'patients') }}