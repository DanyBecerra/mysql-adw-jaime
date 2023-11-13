CREATE DATABASE IF NOT EXISTS WhBG;
use WhBG;
CREATE TABLE IF NOT EXIST DimStore (
  Store_Key INT Auto_increment PRIMARY KEY,
  Store_ID INT NULL DEFAULT NULL,
  StoreName VARCHAR(255),
  ProvinceName VARCHAR(255),
  CountryName VARCHAR(255),
  INDEX Store_ID (Store_ID) VISIBLE
);

CREATE TABLE IF NOT EXISTS DimEmployeeTitle (
  Title_Key INT AUTO_INCREMENT PRIMARY KEY,
  Title_ID INT NULL DEFAULT NULL,
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
  ProvinceName VARCHAR(255),
  CountryName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS DimEmployee (
  Employee_Key INT Auto_increment PRIMARY KEY,
  Employee_ID INT NULL DEFAULT NULL,
  EmployeeName VARCHAR(255),
  AgeRangeName VARCHAR(255),
  GenderName VARCHAR(255)
)

CREATE TABLE IF NOT EXISTS FactFires (
  Fire_Key INT PRIMARY KEY,
  StoreID_FK INT,
  TitleID_FK INT,
  EmployeeID_FK INT,
  ShiftID_FK INT,
  LocationID_FK INT,
  firingDate DATE,
  amount INT,
  INDEX StoreID_FK (StoreID_FK ASC) VISIBLE,
  INDEX TitleID_FK (TitleID_FK ASC) VISIBLE,
  INDEX EmployeeID_FK (EmployeeID_FK ASC) VISIBLE,
  INDEX ShiftID_FK (ShiftID_FK ASC) VISIBLE,
  INDEX LocationID_FK (LocationID_FK ASC) VISIBLE,
  FOREIGN KEY (StoreID_FK) REFERENCES DimStore(StoreID_PK),
  FOREIGN KEY (TitleID_FK) REFERENCES DimEmployeeTitle(TitleID_PK),
  FOREIGN KEY (EmployeeID_FK) REFERENCES DimEmployee(EmployeeID_PK),
  FOREIGN KEY (ShiftID_FK) REFERENCES DimShift(ShiftID_PK),
  FOREIGN KEY (LocationID_FK) REFERENCES DimEmployeeLocation(LocationID_PK)
);
