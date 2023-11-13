CREATE DATABASE IF NOT EXISTS WhBG;
use WhBG;
CREATE TABLE IF NOT EXISTS DimStore (
  Store_Key INT Auto_increment PRIMARY KEY,
  Store_ID INT NULL DEFAULT NULL,
  StoreName VARCHAR(255),
  ProvinceName VARCHAR(255),
  CountryName VARCHAR(255),
  INDEX Store_ID (Store_ID) VISIBLE
);

CREATE TABLE IF NOT EXISTS DimEmployeeTitle (
  Title_Key INT AUTO_INCREMENT PRIMARY KEY,
  DepartmentName VARCHAR(255),
  TitleName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS DimShift (
  Shift_Key INT AUTO_INCREMENT PRIMARY KEY,
  Shift_ID INT NULL DEFAULT NULL,
  StartTime VARCHAR(255),
  EndTime VARCHAR(255),
  ShiftName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS DimEmployeeLocation (
  Location_Key INT Auto_increment PRIMARY KEY,
  Location_ID INT NULL DEFAULT NULL,
  ProvinceName VARCHAR(255),
  CountryName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS DimEmployee (
  Employee_Key INT Auto_increment PRIMARY KEY,
  Employee_ID INT NULL DEFAULT NULL,
  EmployeeName VARCHAR(255),
  AgeRangeName VARCHAR(255),
  GenderName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS FactFires (
  Store_FK INT,
  Title_FK INT,
  Employee_FK INT,
  Shift_FK INT,
  Location_FK INT,
  amount INT,
  INDEX Store_FK (Store_FK ASC) VISIBLE,
  INDEX Title_FK (Title_FK ASC) VISIBLE,
  INDEX Employee_FK (Employee_FK ASC) VISIBLE,
  INDEX Shift_FK (Shift_FK ASC) VISIBLE,
  INDEX Location_FK (Location_FK ASC) VISIBLE,
  FOREIGN KEY (Store_FK) REFERENCES DimStore(Store_Key),
  FOREIGN KEY (Title_FK) REFERENCES DimEmployeeTitle(Title_Key),
  FOREIGN KEY (Employee_FK) REFERENCES DimEmployee(Employee_Key),
  FOREIGN KEY (Shift_FK) REFERENCES DimShift(Shift_Key),
  FOREIGN KEY (Location_FK) REFERENCES DimEmployeeLocation(Location_Key)
);
