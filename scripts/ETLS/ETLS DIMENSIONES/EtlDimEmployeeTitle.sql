INSERT INTO WhBG.DimEmployeeTitle (
    Title_ID,
    DepartmentName,
    TitleName
)
SELECT
    E.BusinessEntityID as Title_ID,
    D.Name as DepartmentName,
    E.jobTitle as TitleName
FROM adw.HumanResources_EmployeeDepartmentHistory AS DH
join adw.HumanResources_Employee E on E.BusinessEntityID = DH.BusinessEntityID
join adw.HumanResources_Department D on D.DepartmentID = DH.DepartmentID
where DH.EndDate is null;

