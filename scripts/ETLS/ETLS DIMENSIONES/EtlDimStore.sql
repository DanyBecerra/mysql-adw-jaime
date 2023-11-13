    INSERT INTO WhBG.DimStore (
        Store_ID,
        StoreName,
        ProvinceName,
        CountryName
    )
    SELECT DISTINCT
        S.SalesPersonID as Store_ID,
        S.Name AS StoreName,
        SP.Name AS ProvinceName,
        CR.Name AS CountryName
    FROM adw.Sales_Store S
    JOIN adw.Sales_SalesPerson sp ON S.SalesPersonID = sp.BusinessEntityID
    JOIN adw.Sales_SalesTerritory ST ON sp.TerritoryID = ST.TerritoryID
    JOIN adw.Person_StateProvince SP ON ST.TerritoryID = SP.TerritoryID
    JOIN adw.Person_CountryRegion CR ON SP.CountryRegionCode = CR.CountryRegionCode;