SELECT 
  e.EmployeeName, 
  s.ShiftName, 
  d.day_name
FROM FactHires h
INNER JOIN DimEmployee e ON h.EmployeeID = e.EmployeeID
INNER JOIN DimShift s ON h.ShiftID = s.ShiftID
INNER JOIN DimDate d ON h.Date = d.date
WHERE d.day_name = 'Monday';

SELECT 
  AgeRangeName, 
  COUNT() AS NumberOfEmployees 
FROM DimEmployee
GROUP BY AgeRangeName;

SELECT 
  et.TitleName, 
  COUNT(*) AS NumberOfHires 
FROM FactHires h
INNER JOIN DimEmployeeTitle et ON h.TitleID= et.TitleID
GROUP BY et.TitleName;

SELECT 
  e.EmployeeName, 
  et.DepartmentName, 
  et.TitleName 
FROM DimEmployee e
INNER JOIN DimEmployeeTitle et ON e.EmployeeID_PK = et.TitleID_PK;