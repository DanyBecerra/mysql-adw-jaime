INSERT INTO WhBG.DimStore (
    StoreName,
    ProvinceName,
    CountryName
)
SELECT DISTINCT 
    S.Name AS StoreName,
    SP.Name AS ProvinceName,
    CR.Name AS CountryName
FROM adw.Sales_Store S
JOIN adw.Sales_Customer C ON S.BusinessEntityID = C.customerID
JOIN adw.Sales_SalesTerritory ST ON C.TerritoryID = ST.TerritoryID
JOIN adw.Person_StateProvince SP ON ST.TerritoryID = SP.TerritoryID
JOIN adw.Person_CountryRegion CR ON SP.CountryRegionCode = CR.CountryRegionCode;