INSERT INTO WhBG.FactHires (
    Title_FK,
    Employee_FK,
    Shift_FK,
    Date_FK,
    amount
)
SELECT 
    Title_FK,
    Employee_FK,
    Shift_FK,
    Date_FK,
    amount
    FROM (

        select 
            DimEmployeeTitle.Title_Key as Title_FK,
            DimShift.Shift_Key as Shift_FK,
            DimEmployee.Employee_Key as Employee_FK,
            Dimdate.date_key as Date_FK,
            1 as amount
        from adw.HumanResources_Employee E
            inner join WhBG.DimEmployee as DimEmployee on E.BusinessEntityID = DimEmployee.Employee_ID 
            inner join WhBG.Dimdate as Dimdate on Dimdate.date_ID = E.BusinessEntityID 
            inner join adw.HumanResources_EmployeeDepartmentHistory eph on DimEmployee.Employee_ID = eph.BusinessEntityID
            inner join WhBG.DimShift as DimShift on DimShift.Shift_ID = eph.ShiftID 
            inner join WhBG.DimEmployeeTitle as DimEmployeeTitle on DimEmployeeTitle.TitleName = E.JobTitle 
        where  eph.EndDate is not null
    ) as datos
    Group by 
        Title_FK,
        Employee_FK,
        Shift_FK,
        Date_FK;

    




