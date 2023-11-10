INSERT INTO WhBG.DimEmployeeLocation (
    LocationID_PK,
    ProvinceName,
    CountryName
)
SELECT DISTINCT
    a.AddressID as LocationID_PK,
    sp.Name as ProvinceName,
    cr.Name as CountryName
FROM 
    adw.Person_Address a
    JOIN adw.Person_StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
    JOIN adw.Person_CountryRegion cr ON sp.CountryRegionCode = cr.CountryRegionCode;