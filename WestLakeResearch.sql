/*Create database*/
create database WestLakeResearchHospital;

/* Doctor Table */
CREATE TABLE Doctor
(
DocterKey nchar(10) NOT NULL PRIMARY KEY,
DoctorLastName nvarchar(50) NOT NULL,
DoctorFirstName nvarchar(50),
DoctorPhone nchar(10)
)

/*  Patient Table */
CREATE TABLE Patient
(
PatientKey nchar(10) NOT NULL PRIMARY KEY,
PatientLastName nvarchar(50) NOT NULL,
PatientFirstName nvarchar(50),
PatientPhone nchar(10) NOT NULL,
PatientEmail nvarchar(50),
PatientAddress nvarchar(50),
PatientCity nvarchar(50),
PatientState nvarchar(50),
PatientZipcode nchar(10),
DoctorKey nchar(10) FOREIGN KEY REFERENCES Doctor(DoctorKey),
GroupID nvarchar(50) NOT NULL,
PatientAddedDate Date NOT NULL,
PatientDroppedDate Date NOT NULL
)

/* Medical Histoy */
Create table MedicalHistory
(
  PatientKey nchar(10) primary key not null,
  Allergies nvarchar(50),
  LungDisorder nvarchar(50),
  HighBloodPressure nvarchar(50),
  HeartTrouble nvarchar(50),
  Digestive nvarchar(50),
  Cancer nvarchar(50),
  Kidney nvarchar(50),
  Diabetes nvarchar(50),
  Arthritis nvarchar(50),
  Hepatitis nvarchar(50),
  Malaria nvarchar(50),
  BloodDisorder nvarchar(50),
  PhysicalDefect nvarchar(50),
  VisionHearing nvarchar(50),
  LifeThreatening nvarchar(50) not null,
  DepressionDescriptor nvarchar(50),
  DateDiagnosed Date not null,
  DepressionHistory nvarchar(50),
  FamilyDepression nvarchar(50)
 )

/* Symptom */
Create table Symptom
(
     SymptomKey nvarchar(10) primary key not null,
     SymptomDescription nvarchar(50) not null
)

/* Depression Detail */
create table DepressionDetail
(
  DepressionDetailID nchar(10) primary key not null,
  SymptomKey nchar(10) references Symptom(SymptomKey) not null,
  PatientKey nchar(10) references MedicalHistory(PatientKey) not null
)

/* Appointment */
create table Appointment
(
  AppointmentKey nchar(10) primary key not null,
  AppointmentDate date not null,
  AppointmentTime time not null,
  DoctorKey nchar(10) references Doctor(DoctorKey) not null,
  PatientKey nchar(10) references Patient(PatientKey)not null
 )

/* Appointment Details */
create table AppointmentDetails
(
  AppointmentDetailKey nchar(10) primary key not null,
  AppointmentKey nchar(10) references Appointment(AppointmentKey) not null,
  DepressionRating nvarchar(50) not null,
  SleepDifficulties nvarchar(50),
  LossOfAppetitie nvarchar(50),
  InabilityToLeaveHouse nvarchar(50),
  Anxiety nvarchar(50),
  SuicidalThoughts nvarchar(50),
  BloodPressure nvarchar(50),
  PersonWeight nvarchar(50),
  Pulse nvarchar(50),
  DoctorsNotes nvarchar(50)
)

/* Inserting Data into doctor table */
INSERT INTO Doctor (DoctorKey,DoctorLastName,DoctorFirstName,DoctorPhone)
VALUES(1,'Rahul','vyasan',6038589643),(2,'Sundeep','Pulavathi',6038584543),(3,'James','Wan',6038581234);

/* Inserting Data into Patient table */
Insert into Patient values (20,'Ashwin','Katakam',6038581234,'Ashwin@yahoo.com','Apt37','manchester','nh','03104',1,789,'20160326','20160524'),
(21,'Raviteja','Gurram',6038587777,'gurram@yahoo.com','Apt39','burlington','vermont','03106',2,789,'2016-03-27','20160530'),
(22,'Aneesh','Mateti',6038588888,' ','Apt48','portsmoth','Maine','03107',3,789,'20160328','20160531')

/* Inserting data into Medical History */
Insert INTO MedicalHistory (PatientKey, VisionHearing, LifeThreatening, DateDiagnosed) Values (20,'impaired','no','20160326');
Insert INTO MedicalHistory (PatientKey, HeartTrouble, LifeThreatening, DateDiagnosed) Values
(21, ' Blocked vein', 'Yes', '20160327');
Insert INTO MedicalHistory (PatientKey, Allergies, LifeThreatening, DateDiagnosed) Values
(22, ' Scabies', 'No', '20160328');

/* Inserting into Symptom table */
Insert Into Symptom values(100,'Vision hearing consists of two types which are very dangerous');
Insert into Symptom values(101,'Heart trouble can be stated as the trouble which is caused by the blockage of vessels');

/* Inserting into DepressionDetail table */
Insert into DepressionDetail values (70, 100 , 20);
Insert into DepressionDetail values (71, 101 ,21);
Insert into DepressionDetail values (72, 101 ,22);

/* Inserting into Appointment table */
Insert into Appointment values (91, '20160326', '09:06:45',1,20);
Insert into Appointment values (92, '20160327', '10:07:50.456897',2,21);
Insert into Appointment values (93, '20160328', '11:07:50.321546',2,22);

/* Inserting into AppointmentDetails table */
Insert into AppointmentDetails (AppointmentDetailKey,AppointmentKey,DepressionRating,SleepDifficulties) values
(61,91,'serious','yes');
Insert into Insert into AppointmentDetails (AppointmentDetailKey,AppointmentKey,DepressionRating,SleepDifficulties) values
(62,92,'mild','No');
Insert into Insert into AppointmentDetails (AppointmentDetailKey,AppointmentKey,DepressionRating,SleepDifficulties) values
(63,93,'low','Yes');

/* select statements */
select * from Doctor where DoctorKey=1;
select * from Patient where GroupID=789 and PatientState='nh';
select * from Patient where DoctorKey=1 or DoctorKey=2;

/* aggregate functions*/
select count(PatientKey) as NumberOfPatients from Patient;
select max(PatientKey) as MaximumNumber from Patient;
select min(PatientKey) as ManimumNumber from Patient;

/* Joins */
select Patient.PatientLastName, Patient.PatientCity, Doctor.DoctorLastName
from Patient
inner join Doctor
on Patient.DoctorKey=Doctor.DoctorKey;

select MedicalHistory.LifeThreatening, MedicalHistory.VisionHearing, Patient.PatientLastName
from MedicalHistory
full outer join Patient
on MedicalHistory.PatientKey=Patient.PatientKey
order by PatientLastName;

/* delete */
delete from Doctor where DoctorFirstName='Rahul' and DoctorLastName='Vyasan'

/* Update */
update Symptom SET SymptomDescription='Blood disorders are very serious' where SymptomKey=103

/* Alter */
alter table Doctor
add DoctorSpecialization nvarchar(50)
