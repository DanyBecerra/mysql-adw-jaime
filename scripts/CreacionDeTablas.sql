CREATE DATABASE IF NOT EXISTS WhBG;
use WhBG;
CREATE TABLE DimStore (
  StoreID_PK INT Auto_increment PRIMARY KEY,
  StoreName VARCHAR(255),
  ProvinceName VARCHAR(255),
  CountryName VARCHAR(255)
);

CREATE TABLE DimEmployeeTitle (
  TitleID_PK INT AUTO_INCREMENT PRIMARY KEY,
  DepartmentName VARCHAR(255),
  TitleName VARCHAR(255)
);

CREATE TABLE DimShift (
  ShiftID_PK INT PRIMARY KEY,
  StartTime VARCHAR(255),
  EndTime VARCHAR(255),
  ShiftName VARCHAR(255)
);

CREATE TABLE DimEmployeeLocation (
  LocationID_PK INT PRIMARY KEY,
  ProvinceName VARCHAR(255),
  CountryName VARCHAR(255)
);

CREATE TABLE DimEmployee (
  EmployeeID_PK INT PRIMARY KEY,
  EmployeeName VARCHAR(255),
  AgeRangeName VARCHAR(255),
  GenderName VARCHAR(255)
);

CREATE TABLE FactFires (
  FireID_PK INT PRIMARY KEY,
  StoreID_FK INT,
  TitleID_FK INT,
  EmployeeID_FK INT,
  ShiftID_FK INT,
  LocationID_FK INT,
  firingDate DATE,
  FOREIGN KEY (StoreID_FK) REFERENCES DimStore(StoreID_PK),
  FOREIGN KEY (TitleID_FK) REFERENCES DimEmployeeTitle(TitleID_PK),
  FOREIGN KEY (EmployeeID_FK) REFERENCES DimEmployee(EmployeeID_PK),
  FOREIGN KEY (ShiftID_FK) REFERENCES DimShift(ShiftID_PK),
  FOREIGN KEY (LocationID_FK) REFERENCES DimEmployeeLocation(LocationID_PK)
);
