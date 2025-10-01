create database hospital  
use hospital ;

CREATE TABLE Company (
    CompanyID      INT PRIMARY KEY,
    Name           VARCHAR(100) NOT NULL,
    Address        VARCHAR(200),
    PhoneNumber    VARCHAR(20)
);

CREATE TABLE Drugs (
    CompanyID      INT,
    TradeName      VARCHAR(100),
    DrugStrength   VARCHAR(50),
    PRIMARY KEY (CompanyID, TradeName, DrugStrength),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
        ON DELETE CASCADE
);

CREATE TABLE Prescription (
    PrescriptionID       INT PRIMARY KEY,
    PrescriptionDate     DATE NOT NULL,
    Quantity             INT NOT NULL,
    DosageInstructions   VARCHAR(200),
    CompanyID            INT,
    TradeName            VARCHAR(100),
    DrugStrength         VARCHAR(50),
    FOREIGN KEY (CompanyID, TradeName, DrugStrength)
        REFERENCES Drugs(CompanyID, TradeName, DrugStrength)
        ON DELETE CASCADE
);

CREATE TABLE Doctor (
    DoctorID        INT PRIMARY KEY,
    FirstName       VARCHAR(50) NOT NULL,
    LastName        VARCHAR(50) NOT NULL,
    Email           VARCHAR(100),
    PhoneNumber     VARCHAR(20),
    Specialty       VARCHAR(100),
    YearsExperience INT,
    PrescriptionID  INT,
    FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionID)
);

CREATE TABLE Patient (
    URNumber       INT PRIMARY KEY,
    Name           VARCHAR(100) NOT NULL,
    Address        VARCHAR(200),
    Age            INT,
    PhoneNumber    VARCHAR(20),
    Email          VARCHAR(100),
    NumberOfCard   VARCHAR(50),
    DoctorID       INT,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);
