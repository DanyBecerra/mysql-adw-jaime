INSERT INTO WhBG.DimEmployeeTitle (
    DepartmentName,
    TitleName
)
SELECT 
    D.Name as DepartmentName,
    E.jobTitle as TitleName
FROM adw.HumanResources_EmployeeDepartmentHistory AS DH
join adw.HumanResources_Employee E on E.BusinessEntityID = DH.BusinessEntityID
join adw.HumanResources_Department D on D.DepartmentID = DH.DepartmentID
where DH.EndDate is null;

