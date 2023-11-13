use WhBG
SELECT distinct
  E.EmployeeName
FROM DimStore D
JOIN FactHires F ON D.Store_Key = F.Store_FK
JOIN DimEmployee E ON F.Employee_FK = E.Employee_Key;

