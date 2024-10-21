with deleted_patients as (
    -- Simulate deletion from Patients table
    select PatientID from {{ ref('patients') }}
    where PatientID is null
)

-- Check if corresponding appointments are also deleted
select *
from deleted_patients
left join {{ ref('medical_data') }} on deleted_patients.PatientID = {{ ref('medical_data') }}.PatientID
where {{ ref('medical_data') }}.PatientID is not null
