--1/SELECT: Retrieve all columns from the Doctor table.
select * from Doctor
--2/ORDER BY: List patients in ascending order of their ages
select * from patient
ORDER BY Age asc 
--3/OFFSET FETCH: Retrieve the first 10 patients from the Patient table, starting from the 5th record.
select * from patient
ORDER BY URNumber
OFFSET 4 rows 
FETCH next 10 rows only 
--4/SELECT TOP: Retrieve the top 5 doctors.
select top(5)* from Doctor
--5/SELECT DISTINCT: Get unique addresses from patients.
select distinct address from patient
--6/WHERE: Patients aged 25.
select * from patient
where age = 25 
--7/NULL: Patients with no email.
select * from patient
where email is null 
--8/AND: Doctors with >5 years experience and Cardiology.
select * from Doctor
where YearsExperience > 5 AND Specialty = 'Cardiology'
--9/IN: Doctors in Dermatology or Oncology.
select * from Doctor
where Specialty in ( 'Dermatology' , 'Oncology' )
--10/BETWEEN: Patients aged 18–30.
select * from patient
where age between 18 and 30 
--11/LIKE: Doctors whose names start with 'Dr.'.
select * from Doctor
where FirstName like 'Dr. %'
--12/Aliases:
select FirstName , Specialty as Doctor_Specialty
from Doctor
--13/JOINs: Prescriptions + Patient names.
SELECT pr.PrescriptionID, pat.Name AS Patient_Name, pr.TradeName, pr.PrescriptionDate
FROM Prescription pr
JOIN Patient pat ON pr.URNumber = pat.URNumber

--14/GROUP BY: Count patients per city (Address).
select Address, count(*) AS PatientCount
from patient
group by Address 
--15/HAVING: Cities with more than 3 patients.
select Address, count(*) AS PatientCount
from patient
group by Address 
having count(*) >3 
--16/GROUPING SETS:
select Address,age ,count(*) AS PatientCount
from Patient
group by GROUPING SETS ((Address), (Age))
--17/CUBE
select Address,age ,count(*) AS PatientCount
from Patient
group by CUBE ((Address), (Age))
--18/ROLLUP
select Address,age ,count(*) AS PatientCount
from Patient
group by ROLLUP ((Address), (Age))
--19/EXISTS: Patients who have prescriptions.
SELECT * 
FROM Patient pat
WHERE EXISTS (
    SELECT 1 
    FROM Prescription pr
    WHERE pr.URNumber = pat.URNumber
);
--20/UNION: Doctors + Patients list (names).
SELECT FirstName AS Name FROM Doctor
UNION
select name from Patient ;
--21/CTE: Patients with their doctors.
WITH Patients_Doctors as (
   sELECT P.Name AS PatientName, D.FirstName + ' ' + D.LastName AS DoctorName
    FROM Patient P
    JOIN Doctor D ON P.DoctorID = D.DoctorID
)
SELECT * FROM Patients_Doctors;
--22/INSERT: New doctor.
INSERT INTO Doctor (FirstName , LastName, Specialty, YearsExperience, PhoneNumber, Email)
VALUES ('Dr. Ahmed ', ' Ali','Cardiology', 10, '01012345678', 'ahmed.ali@example.com')
--23/INSERT Multiple Rows:
INSERT INTO Patient (Name, Age, Address, PhoneNumber, NumberOfCard, DoctorID)
VALUES ('Omar Hassan', 20, 'Cairo', '0101111111', 12345, 1),('Sara Ali', 25, 'Giza', '0102222222', 67890, 2)
--24/UPDATE: Change doctor’s phone.
UPDATE Doctor
set PhoneNumber = '01124942806'
where DoctorID = 50
--25/UPDATE JOIN: Update patient city if prescription from specific doctor.

UPDATE P
SET P.Address = 'Cardiac Care Unit, Geelong'
FROM Patient P
JOIN Prescription PR ON P.URNumber = PR.URNumber
JOIN Doctor D ON PR.PrescriptionID = D.PrescriptionID
WHERE D.Specialty = 'Cardiology'
--26/DELETE: Remove a patient.
DELETE from Patient
where name = 'mina'
--27/Transaction: Insert doctor + patient together
begin Transaction
INSERT INTO Doctor (FirstName , LastName, Specialty, YearsExperience, PhoneNumber, Email)
VALUES ('Dr. Mona ',' Khaled', 'Dermatology', 7, '0103333333', 'mona@example.com');
INSERT INTO Patient (Name, Age, Address, PhoneNumber, Email, NumberOfCard, DoctorID)
VALUES ('Heba Said', 28, 'Cairo', '0104444444', 'heba@example.com', 54321, SCOPE_IDENTITY());
commit Transaction
--28/View: Patients + doctors.
go
create view PatientDoctorView AS 
SELECT p.Name AS PatientName,d.FirstName + ' ' + d.LastName AS DoctorName, d.Specialty
FROM Patient p JOIN Doctor d 
ON p.DoctorID = d.DoctorID
--29/Index: On Patient phone.
go
create index in_patient_phone 
on patient (PhoneNumber)
--30/Backup Database
Backup Database Prescription_System
to disk = ''
