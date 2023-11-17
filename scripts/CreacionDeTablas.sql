CREATE DATABASE IF NOT EXISTS WhBG;
use WhBG;

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



CREATE TABLE IF NOT EXISTS DimEmployee (
  Employee_Key INT Auto_increment PRIMARY KEY,
  Employee_ID INT NULL DEFAULT NULL,
  EmployeeName VARCHAR(255),
  AgeRangeName VARCHAR(255),
  GenderName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Dimdate (
  date_key INT AUTO_INCREMENT,
  date_ID INT(8) NOT NULL,
  date_value DATE NOT NULL,
  date_medium CHAR(16) NOT NULL,
  month_number TINYINT(3) NOT NULL,
  month_name CHAR(12) NOT NULL,
  yearV SMALLINT(5) NOT NULL,
  year_month_number CHAR(7) NOT NULL,
  PRIMARY KEY (date_key),
  INDEX date (date_value) VISIBLE,
  INDEX date_value (`date_value` ASC) VISIBLE
);

CREATE TABLE IF NOT EXISTS FactHires (
  Title_FK INT,
  Employee_FK INT,
  Shift_FK INT,
  amount INT,
  Date_FK INT,
  INDEX Title_FK (Title_FK ASC) VISIBLE,
  INDEX Employee_FK (Employee_FK ASC) VISIBLE,
  INDEX Shift_FK (Shift_FK ASC) VISIBLE,
  INDEX Date_FK (Date_FK ASC) VISIBLE,
  FOREIGN KEY (Title_FK) REFERENCES DimEmployeeTitle(Title_Key),
  FOREIGN KEY (Employee_FK) REFERENCES DimEmployee(Employee_Key),
  FOREIGN KEY (Shift_FK) REFERENCES DimShift(Shift_Key),
  FOREIGN KEY (Date_FK) REFERENCES Dimdate(date_key)
);
