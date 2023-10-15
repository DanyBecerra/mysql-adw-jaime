use adw;

WITH proveedor_parts AS (
    SELECT
        V.Name AS Proveedor,
        COUNT(DISTINCT PVD.ProductID) AS Cantidad_Productos,
        AVG(POH.OrderDate - POH.ShipDate) AS Promedio_Dias_Entrega
    FROM Purchasing_Vendor V
    INNER JOIN Purchasing_ProductVendor PVD ON V.BusinessEntityID = PVD.BusinessEntityID
    INNER JOIN Purchasing_PurchaseOrderDetail POD ON PVD.ProductID = POD.ProductID
    INNER JOIN Purchasing_PurchaseOrderHeader POH ON POD.PurchaseOrderID = POH.PurchaseOrderID
    GROUP BY V.Name
),
pivote AS (
    SELECT
        Proveedor,
        Cantidad_Productos,
        CASE 
            WHEN Promedio_Dias_Entrega <= 3 THEN 'Rápido'
            WHEN Promedio_Dias_Entrega <= 7 THEN 'Medio'
            ELSE 'Lento'
        END AS Velocidad_Entrega
    FROM proveedor_parts
)
SELECT 
    Proveedor,
    Cantidad_Productos,
    Velocidad_Entrega
FROM pivote
ORDER BY Cantidad_Productos DESC
LIMIT 5;
