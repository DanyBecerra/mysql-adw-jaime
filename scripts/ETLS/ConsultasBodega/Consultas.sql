use WhBG;

-- Muestra el nombre de los empleados que fueron contratados en el mes de enero.


SELECT 
  e.EmployeeName, 
  s.ShiftName as ShiftTime, 
  d.month_name
FROM FactHires h
INNER JOIN DimEmployee e ON h.Employee_FK = e.Employee_Key
INNER JOIN DimShift s ON h.Shift_FK = s.Shift_Key
INNER JOIN Dimdate d ON h.Date_FK = d.date_key
WHERE d.month_name = 'January'; 

SELECT 
  sum(h.amount)
FROM FactHires h
INNER JOIN DimEmployee e ON h.Employee_FK = e.Employee_Key
INNER JOIN DimShift s ON h.Shift_FK = s.Shift_Key
INNER JOIN Dimdate d ON h.Date_FK = d.date_key
WHERE d.month_name = 'January'; 


-- Esta consulta recupera el nombre de cada título y cuenta el número de veces que cada título ha sido asociado a una contratación en la tabla FactHires. Los resultados se agrupan por el nombre del título.
SELECT 
  et.TitleName, 
  sum(h.amount) AS NumberOfHires
FROM FactHires h
INNER JOIN DimEmployeeTitle et ON h.Title_FK = et.Title_Key -- Corregido para usar las claves correctas
GROUP BY et.TitleName;

-- Consulta para obtener todos los empleados con su correspondiente turno y nombre de departamento

SELECT 
  e.EmployeeName,
  s.ShiftName,
  et.DepartmentName
FROM DimEmployee e
LEFT JOIN FactHires f ON e.Employee_Key = f.Employee_FK
LEFT JOIN DimShift s ON f.Shift_FK = s.Shift_Key
LEFT JOIN DimEmployeeTitle et ON f.Title_FK = et.Title_Key;

-- Esta consulta calcula el total de contrataciones por departamento sumando el campo amount.
SELECT 
  et.DepartmentName, 
  SUM(h.amount) AS TotalHires 
FROM FactHires h
INNER JOIN DimEmployeeTitle et ON h.Title_FK = et.Title_Key 
GROUP BY et.DepartmentName;

-- Ecalcula el total de contrataciones por turno 

SELECT 
  s.ShiftName, 
  SUM(h.amount) AS TotalHires 
FROM FactHires h
INNER JOIN DimShift s ON h.Shift_FK = s.Shift_Key 
GROUP BY s.ShiftName;