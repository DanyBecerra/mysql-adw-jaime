select 
            eph.ShiftID
        from adw.HumanResources_Employee E
            join WhBG.DimEmployee as DimEmployee on E.BusinessEntityID = DimEmployee.Employee_ID 
            join WhBG.Dimdate as Dimdate on Dimdate.date_ID = E.BusinessEntityID 
            join adw.HumanResources_EmployeeDepartmentHistory eph on DimEmployee.Employee_ID = eph.BusinessEntityID
            join WhBG.DimShift as DimShift on DimShift.Shift_ID = eph.ShiftID
            join WhBG.DimEmployeeTitle as DimEmployeeTitle on DimEmployeeTitle.TitleName = E.JobTitle 
        where  eph.EndDate is null