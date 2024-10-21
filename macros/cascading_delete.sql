{% macro cascading_delete() %}
    -- Step 1: Identify orphaned PatientIDs in appointments table
    with orphaned_patients as (
        SELECT
            a.PatientID
        FROM {{ source('sql_server', 'appointments') }} a
        LEFT JOIN {{ source('sql_server', 'patients') }} p
            ON a.PatientID = p.PatientID
        WHERE p.PatientID IS NULL
    )
    {% set orphaned_patients_cte = "orphaned_patients" %}

    -- Delete from appointments
    delete from {{ source('sql_server', 'appointments') }}
    where PatientID in (select PatientID from {{ orphaned_patients_cte }});

    -- Delete from medications
    delete from {{source('raw_json','medications')}}
    where PatientID in (select PatientID from {{ orphaned_patients_cte }});

    -- Delete from medical_data
    delete from {{ source('raw_csv', 'medical_data') }}
    where PatientID in (select PatientID from {{ orphaned_patients_cte }});

{% endmacro %}