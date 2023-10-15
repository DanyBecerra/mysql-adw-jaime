use adw;
SELECT 
    E.OrganizationLevel,
    E.JobTitle,
    COUNT(E.BusinessEntityID) AS TotalEmpleados
FROM 
    HumanResources_Employee E
GROUP BY 
    E.OrganizationLevel, 
    E.JobTitle
ORDER BY 
    E.OrganizationLevel, 
    TotalEmpleados DESC;


