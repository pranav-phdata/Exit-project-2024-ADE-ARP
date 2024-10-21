<<<<<<< HEAD
-- tests/test_cascading_delete_medical_data.sql

=======
>>>>>>> 4e8fb72a3fb575bb74003a974ed0c58263bfd401
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
