INSERT INTO WhBG.DimEmployeeLocation (
    Location_ID,
    ProvinceName,
    CountryName
)
SELECT
    st.TerritoryID as Location_ID,
    psp.Name as ProvinceName,
    cr.Name as CountryName
FROM 
    adw.Sales_SalesPerson sp
    JOIN adw.HumanResources_Employee e ON sp.BusinessEntityID = e.BusinessEntityID
    join adw.Sales_SalesTerritory st ON sp.TerritoryID = st.TerritoryID
    JOIN adw.Person_StateProvince psp ON st.TerritoryID = psp.TerritoryID
    JOIN adw.Person_CountryRegion cr ON psp.CountryRegionCode = cr.CountryRegionCode;