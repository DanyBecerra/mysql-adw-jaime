use adw;

WITH EmpleadosPorDepartamento AS (
    SELECT 
        d.Name AS Departamento,
        COUNT(e.BusinessEntityID) AS NumeroDeEmpleados
    FROM 
        HumanResources_Department d
    LEFT JOIN 
        HumanResources_EmployeeDepartmentHistory edh ON d.DepartmentID = edh.DepartmentID
    LEFT JOIN 
        HumanResources_Employee e ON edh.BusinessEntityID = e.BusinessEntityID
    WHERE 
        edh.EndDate IS NULL  -- Esto asegura que el empleado aún está en ese departamento
    GROUP BY 
        d.Name
),
RotacionPorDepartamento AS (
    SELECT 
        d.Name AS Departamento,
        COUNT(DISTINCT edh.BusinessEntityID) AS RotacionDeEmpleados
    FROM 
        HumanResources_Department d
    LEFT JOIN 
        HumanResources_EmployeeDepartmentHistory edh ON d.DepartmentID = edh.DepartmentID
    WHERE 
        edh.EndDate IS NOT NULL  -- Esto indica que el empleado ya no está en ese departamento
    GROUP BY 
        d.Name
)
SELECT 
    epd.Departamento,
    epd.NumeroDeEmpleados,
    rpd.RotacionDeEmpleados
FROM 
    EmpleadosPorDepartamento epd
LEFT JOIN 
    RotacionPorDepartamento rpd ON epd.Departamento = rpd.Departamento
ORDER BY 
    epd.NumeroDeEmpleados DESC
limit 5;
