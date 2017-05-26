
/* creating view */
CREATE VIEW [PatientMedical] AS
SELECT LifeThreatening,VisionHearing,PatientLastName
FROM MedicalHistory a
INNER JOIN Patient b
on a.PatientKey=b.PatientKey
where DoctorKey=1

/*creating stored procedure */
Create Procedure make_appointment
    (@AppointmentKey nchar(10), @AppointmentDate Date, @AppointmentTime time(7), @DoctorKey nchar(10),@PatientKey nchar(10))
As
Begin
    Insert Into Appointment
    Values (@AppointmentKey, @AppointmentDate, @AppointmentTime, @DoctorKey,@PatientKey)
End

/* execute stored procedure */
execute make_appointment 7,'12-02-2016','01:30:12',1,22


