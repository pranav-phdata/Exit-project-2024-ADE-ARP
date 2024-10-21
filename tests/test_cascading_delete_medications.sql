with deleted_patients as (
    -- Simulate deletion from Patients table
    select PatientID from {{ ref('patients') }}
    where PatientID is null
)

-- Check if corresponding appointments are also deleted
select *
from deleted_patients
left join {{ ref('medications') }} on deleted_patients.PatientID = {{ ref('medications') }}.PatientID
where {{ ref('medications') }}.PatientID is not null
