INSERT INTO WhBG.DimEmployee (
    Employee_ID,
    EmployeeName,
    AgeRangeName,
    GenderName
)
SELECT 
    e.BusinessEntityID as Employee_ID,
    CONCAT(p.FirstName, ' ', p.LastName) as EmployeeName, -- Concatenation method for full name might vary based on SQL dialect
    CASE 
    WHEN TIMESTAMPDIFF(YEAR, e.BirthDate, CURDATE()) BETWEEN 0 AND 20 THEN '0-20'
    WHEN TIMESTAMPDIFF(YEAR, e.BirthDate, CURDATE()) BETWEEN 21 AND 30 THEN '21-30'
    WHEN TIMESTAMPDIFF(YEAR, e.BirthDate, CURDATE()) BETWEEN 31 AND 40 THEN '31-40'
    WHEN TIMESTAMPDIFF(YEAR, e.BirthDate, CURDATE()) BETWEEN 41 AND 50 THEN '41-50'
    WHEN TIMESTAMPDIFF(YEAR, e.BirthDate, CURDATE()) BETWEEN 51 AND 60 THEN '51-60'
    ELSE '60+'
END as AgeRangeName,
    e.Gender as GenderName
FROM 
    adw.HumanResources_Employee e
    JOIN adw.Person_Person p ON e.BusinessEntityID = p.BusinessEntityID;