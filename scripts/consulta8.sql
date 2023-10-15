use adw;
SELECT 
    JobTitle AS 'Título del Empleado',
    COUNT(*) AS 'Número de Empleados'
FROM 
    HumanResources_Employee
GROUP BY 
    JobTitle
ORDER BY 
    COUNT(*) DESC
limit 5;