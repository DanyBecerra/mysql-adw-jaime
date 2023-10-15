use adw;

-- Empleados
select *
from HumanResources_Employee
limit 6
;
WITH produccion AS (
    SELECT
        p.ProductID,
        p.Name AS Producto,
        pc.Name AS Categoria,
        psc.Name AS Subcategoria,
        SUM(wo.OrderQty) AS CantidadProduccion,
        plph.ListPrice AS CostoUnitario,
        SUM(wo.OrderQty) * plph.ListPrice AS CostoProduccionTotal
    FROM Production_Product AS p
    INNER JOIN Production_ProductSubcategory AS psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    INNER JOIN Production_ProductCategory AS pc ON psc.ProductCategoryID = pc.ProductCategoryID
    INNER JOIN Production_WorkOrder AS wo ON p.ProductID = wo.ProductID
    LEFT JOIN Production_ProductListPriceHistory AS plph ON p.ProductID = plph.ProductID
    GROUP BY p.ProductID, p.Name, pc.Name, psc.Name, plph.ListPrice
)
SELECT 
    Producto,
    Categoria,
    Subcategoria,
    CantidadProduccion,
    CostoUnitario,
    CostoProduccionTotal
FROM produccion
ORDER BY CantidadProduccion DESC
LIMIT 5;
