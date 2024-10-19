-- tests/test_cascading_delete_appointments.sql

with deleted_patients as (
    -- Simulate deletion from Patients table
    select PatientID from {{ ref('patients') }}
    where PatientID is null
)

-- Check if corresponding appointments are also deleted
select *
from deleted_patients
left join {{ ref('appointments') }} on deleted_patients.PatientID = {{ ref('appointments') }}.PatientID
where {{ ref('appointments') }}.PatientID is not null
