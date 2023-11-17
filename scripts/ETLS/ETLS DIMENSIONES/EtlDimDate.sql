INSERT INTO WhBG.Dimdate(
    date_ID,
    date_value,
    date_medium,
    month_number,
    month_name,
    yearV,
    year_month_number
)
SELECT 
    fechas.BusinessEntityID as date_ID,
    fechas.fecha as date_value,
    DATE_FORMAT(fechas.fecha, '%d/%m/%Y') as date_medium,
    MONTH(fechas.fecha) as month_number,
    MONTHNAME(fechas.fecha) as month_name,
    YEAR(fechas.fecha) as yearV,
    DATE_FORMAT(fechas.fecha, '%Y-%m') as year_month_number
FROM (
    SELECT distinct BusinessEntityID, DATE(HireDate) as fecha
    FROM adw.HumanResources_Employee
) as fechas

