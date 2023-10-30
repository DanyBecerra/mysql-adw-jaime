-- Creación de la tabla DimStore
CREATE TABLE DimStore (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(255),
    ProvinceName VARCHAR(255),
    CountryName VARCHAR(255)
);

-- Creación de la tabla DimEmployeeTitle
CREATE TABLE DimEmployeeTitle (
    TitleID INT PRIMARY KEY,
    DepartmentName VARCHAR(255),
    TitleName VARCHAR(255)
);

-- Creación de la tabla DimEmployeeLocation
CREATE TABLE DimEmployeeLocation (
    LocationID INT PRIMARY KEY,
    ProvinceName VARCHAR(255),
    CountryName VARCHAR(255)
);

-- Creación de la tabla DimAgeRange
CREATE TABLE DimAgeRange (
    AgeRangeID INT PRIMARY KEY,
    AgeRangeName VARCHAR(255)
);

-- Creación de la tabla DimGender
CREATE TABLE DimGender (
    GenderID INT PRIMARY KEY,
    GenderName VARCHAR(255)
);

-- Creación de la tabla DimShift
CREATE TABLE DimShift (
    ShiftID INT PRIMARY KEY,
    StartTime VARCHAR(255),
    EndTime VARCHAR(255),
    ShiftName VARCHAR(255)
);

-- Creación de la tabla FactEmployee
CREATE TABLE FactEmployee (
    EmployeeID INT PRIMARY KEY,
    StoreID INT,
    TitleID INT,
    GenderID INT,
    AgeRangeID INT,
    ShiftID INT,
    LocationID INT,
    EmployeeName VARCHAR(255),
    HiringDate DATE,
    FiringDate DATE,
    FOREIGN KEY (StoreID) REFERENCES DimStore(StoreID),
    FOREIGN KEY (TitleID) REFERENCES DimEmployeeTitle(TitleID),
    FOREIGN KEY (GenderID) REFERENCES DimGender(GenderID),
    FOREIGN KEY (AgeRangeID) REFERENCES DimAgeRange(AgeRangeID),
    FOREIGN KEY (ShiftID) REFERENCES DimShift(ShiftID),
    FOREIGN KEY (LocationID) REFERENCES DimEmployeeLocation(LocationID)
);