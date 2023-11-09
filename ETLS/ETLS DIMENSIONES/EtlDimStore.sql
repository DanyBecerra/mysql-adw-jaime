--Name, province y country

INSERT INTO WhBG (
    StoreID,
    StoreName,
    ProvinceName,
    CountryName

)
SELECT DISTINCT 
    S.BusinessEntityID AS StoreID,
    S.Name AS StoreName,
    SP.Name AS ProvinceName,
    CR.Name AS CountryName
FROM Sales_Store S
JOIN Sales_Customer C ON S.BusinessEntityID = C.customerID
JOIN Sales_SalesTerritory ST ON C.TerritoryID = ST.TerritoryID
JOIN Person_StateProvince SP ON ST.TerritoryID = SP.TerritoryID
JOIN Person_CountryRegion CR ON SP.CountryRegionCode = CR.CountryRegionCode;