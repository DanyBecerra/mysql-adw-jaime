INSERT INTO FactHires (
    StoreID_FK,
    TitleID_FK,
    EmployeeID_FK,
    ShiftID_FK,
    LocationID_FK,
    HiringDate
)
SELECT 
    e_BusinessEntityID as EmployeeID_FK,
    edh_ShiftID as ShiftID_FK,
    edh_DepartmentID as TitleID_FK, -- Assuming TitleID_FK refers to DepartmentID
    p_BusinessEntityID as StoreID_FK, -- Assuming StoreID_FK refers to BusinessEntityID in this context
    ea_AddressID as LocationID_FK, -- You will need a join or a logic to relate Address to a specific location ID
    edh_StartDate as HiringDate
FROM 
    adw.HumanResources_Employee e
    JOIN adw.HumanResources_EmployeeDepartmentHistory edh ON e_BusinessEntityID = edh_BusinessEntityID
    JOIN adw.Person_Contact p ON e_BusinessEntityID = p_BusinessEntityID
    JOIN adw.HumanResources_EmployeeAddress ea ON e_BusinessEntityID = ea_BusinessEntityID
GROUP BY
    e_BusinessEntityID,
    edh_ShiftID,
    edh_DepartmentID,
    p_BusinessEntityID,
    ea_AddressID,
    edh_StartDate;