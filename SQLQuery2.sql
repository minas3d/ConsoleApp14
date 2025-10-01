
INSERT INTO Company (CompanyID, Name, Address, PhoneNumber)
VALUES 
(3, 'GlobalHealth', '89 Wellness Rd, Melbourne', '0399991111'),
(4, 'CarePlus', '77 Hope St, Sydney', '0298882222'),
(5, 'LifeMeds', '101 River St, Brisbane', '0733334444');


INSERT INTO Drugs (CompanyID, TradeName, DrugStrength)
VALUES
(3, 'Aspirin', '100mg'),
(3, 'Metformin', '500mg'),
(4, 'Lisinopril', '10mg'),
(4, 'Atorvastatin', '20mg'),
(5, 'Omeprazole', '40mg'),
(5, 'Cetirizine', '10mg');


INSERT INTO Prescription (PrescriptionID, PrescriptionDate, Quantity, DosageInstructions, CompanyID, TradeName, DrugStrength)
VALUES
(104, '2025-09-22', 30, 'Take one tablet daily with water', 3, 'Aspirin', '100mg'),
(105, '2025-09-22', 60, 'Take one tablet twice daily after meals', 3, 'Metformin', '500mg'),
(106, '2025-09-23', 20, 'Take one tablet every morning', 4, 'Lisinopril', '10mg'),
(107, '2025-09-23', 25, 'Take one tablet before bedtime', 4, 'Atorvastatin', '20mg'),
(108, '2025-09-24', 10, 'Take one capsule before breakfast', 5, 'Omeprazole', '40mg'),
(109, '2025-09-24', 15, 'Take one tablet once daily', 5, 'Cetirizine', '10mg');

-- Insert into Doctor (More Doctors)
INSERT INTO Doctor (DoctorID, FirstName, LastName, Email, PhoneNumber, Specialty, YearsExperience, PrescriptionID)
VALUES
(204, 'Sarah', 'Miller', 'sarah.miller@barwonhealth.com', '0466661111', 'Endocrinology', 10, 104),
(205, 'David', 'Wilson', 'david.wilson@barwonhealth.com', '0466662222', 'Diabetology', 14, 105),
(206, 'Sophia', 'Taylor', 'sophia.taylor@barwonhealth.com', '0466663333', 'Cardiology', 9, 106),
(207, 'James', 'Anderson', 'james.anderson@barwonhealth.com', '0466664444', 'Neurology', 20, 107),
(208, 'Laura', 'Martin', 'laura.martin@barwonhealth.com', '0466665555', 'Gastroenterology', 11, 108),
(209, 'Daniel', 'White', 'daniel.white@barwonhealth.com', '0466666666', 'Allergy Specialist', 6, 109);


INSERT INTO Patient (URNumber, Name, Address, Age, PhoneNumber, Email, NumberOfCard, DoctorID)
VALUES
(304, 'Diana Roberts', '5 Park Lane, Melbourne', 50, '0477666777', 'diana.roberts@gmail.com', '4567-8901-2345', 204),
(305, 'Ethan Harris', '14 Bridge Rd, Melbourne', 41, '0477888999', 'ethan.harris@gmail.com', '5678-9012-3456', 205),
(306, 'Fiona Clark', '98 Chapel St, Sydney', 38, '0477001122', 'fiona.clark@gmail.com', '6789-0123-4567', 206),
(307, 'George Hall', '77 Pitt St, Sydney', 65, '0477002233', 'george.hall@gmail.com', '7890-1234-5678', 207),
(308, 'Hannah Lewis', '32 Queen St, Brisbane', 27, '0477003344', 'hannah.lewis@gmail.com', '8901-2345-6789', 208),
(309, 'Ian Walker', '20 King St, Brisbane', 55, '0477004455', 'ian.walker@gmail.com', '9012-3456-7890', 209);
