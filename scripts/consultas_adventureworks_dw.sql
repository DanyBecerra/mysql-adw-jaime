-- Esta consulta muestra el número total de contrataciones por cada tienda
SELECT ds.StoreName, COUNT(fh.Store_FK) AS TotalHires
FROM FactHires fh
JOIN DimStore ds ON fh.Store_FK = ds.Store_Key
GROUP BY ds.StoreName;

-- Esta consulta muestra el número de contrataciones por mes y año
SELECT YEAR(HireDate) AS Year, MONTH(HireDate) AS Month, COUNT(*) AS NumberOfHires
FROM FactHires
GROUP BY YEAR(HireDate), MONTH(HireDate)
ORDER BY YEAR(HireDate), MONTH(HireDate);

-- Esta consulta muestra la cantidad de empleados divididos por rango de edad y género
SELECT de.AgeRangeName, de.GenderName, COUNT(*) AS EmployeeCount
FROM DimEmployee de
JOIN FactHires fh ON de.Employee_Key = fh.Employee_FK
GROUP BY de.AgeRangeName, de.GenderName;

-- Esta consulta muestra los títulos más frecuentes en cada departamento
SELECT det.DepartmentName, det.TitleName, COUNT(fh.Title_FK) AS TitleFrequency
FROM FactHires fh
JOIN DimEmployeeTitle det ON fh.Title_FK = det.Title_Key
GROUP BY det.DepartmentName, det.TitleName
ORDER BY det.DepartmentName, TitleFrequency DESC;


-- Esta consulta muestra la cantidad de empleados por turno
SELECT ds.ShiftName, COUNT(fh.Shift_FK) AS ShiftCount
FROM FactHires fh
JOIN DimShift ds ON fh.Shift_FK = ds.Shift_Key
GROUP BY ds.ShiftName;

-- Esta consulta muestra la distribución de empleados por provincia y país
SELECT del.ProvinceName, del.CountryName, COUNT(fh.Location_FK) AS EmployeeCount
FROM FactHires fh
JOIN DimEmployeeLocation del ON fh.Location_FK = del.Location_Key
GROUP BY del.ProvinceName, del.CountryName;

-- Esta consulta muestra el rendimiento de las tiendas en función del número de contrataciones y el costo total
SELECT ds.StoreName, COUNT(fh.Store_FK) AS Hires, SUM(fh.amount) AS TotalHireCost
FROM FactHires fh
JOIN DimStore ds ON fh.Store_FK = ds.Store_Key
GROUP BY ds.StoreName
ORDER BY TotalHireCost DESC;

-- Esta consulta muestra el total de contrataciones por provincia y país
SELECT del.ProvinceName, del.CountryName, COUNT(*) AS TotalHires
FROM FactHires fh
JOIN DimEmployeeLocation del ON fh.Location_FK = del.Location_Key
GROUP BY del.ProvinceName, del.CountryName;