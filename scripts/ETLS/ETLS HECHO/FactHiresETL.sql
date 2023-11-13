INSERT INTO WhBG.FactHires (
    Store_FK,
    Title_FK,
    Employee_FK,
    Shift_FK,
    Location_FK,
    HireDate,
    amount
)
SELECT 
    Store_FK,
    Title_FK,
    Employee_FK,
    Shift_FK,
    Location_FK,
    HireDate,
    amount
    FROM (

        select 
            DimStore.Store_Key as Store_FK,
            DimShift.Shift_Key as Shift_FK,
            DimEmployeeTitle.Title_Key as Title_FK,
            DimEmployeeLocation.Location_Key as Location_FK,
            DimEmployee.Employee_Key as Employee_FK,
            E.HireDate as HireDate,
            1 as amount
        from adw.HumanResources_Employee E
            inner join WhBG.DimEmployee as DimEmployee on E.BusinessEntityID = DimEmployee.Employee_ID 
            inner join adw.HumanResources_EmployeeDepartmentHistory eph on DimEmployee.Employee_ID = eph.BusinessEntityID
            inner join WhBG.DimShift as DimShift on DimShift.Shift_ID = eph.ShiftID 
            inner join WhBG.DimEmployeeTitle as DimEmployeeTitle on DimEmployeeTitle.TitleName = E.JobTitle 
            inner join adw.Sales_SalesPerson sp on sp.BusinessEntityID = DimEmployee.Employee_ID
            inner join WhBG.DimStore as DimStore on DimStore.Store_ID = sp.BusinessEntityID
            inner join WhBG.DimEmployeeLocation as DimEmployeeLocation on sp.TerritoryID = DimEmployeeLocation.Location_ID 
        where  eph.EndDate is not null
    ) as datos
    Group by 
        Store_FK,
        Title_FK,
        Employee_FK,
        Shift_FK,
        Location_FK,
        HireDate;

    




