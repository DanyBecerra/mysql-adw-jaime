use adw;
-- Cálculo de stock por ubicación
WITH stock_por_ubicacion AS (
    SELECT
        pi.LocationID,
        l.Name AS nombre_ubicacion,
        SUM(pi.Quantity) AS stock_total
    FROM Production_ProductInventory pi
    INNER JOIN Production_Location l ON pi.LocationID = l.LocationID
    GROUP BY pi.LocationID, l.Name
),

-- Cálculo de ingresos por producto y luego se relacionará con la ubicación
ingresos_por_producto AS (
    SELECT
        p.ProductID,
        SUM(sod.LineTotal) AS ingresos_total
    FROM Production_Product p
    INNER JOIN Sales_SalesOrderDetail sod ON p.ProductID = sod.ProductID
    GROUP BY p.ProductID
),

-- Relacionar los ingresos por producto con la ubicación
ingresos_por_ubicacion AS (
    SELECT
        pi.LocationID,
        l.Name AS nombre_ubicacion,
        SUM(ipp.ingresos_total) AS ingresos_total
    FROM Production_ProductInventory pi
    INNER JOIN Production_Location l ON pi.LocationID = l.LocationID
    INNER JOIN ingresos_por_producto ipp ON pi.ProductID = ipp.ProductID
    GROUP BY pi.LocationID, l.Name
)

-- Resultado final
SELECT
    s.nombre_ubicacion,
    s.stock_total,
    i.ingresos_total
FROM stock_por_ubicacion s
LEFT JOIN ingresos_por_ubicacion i ON s.LocationID = i.LocationID
ORDER BY s.stock_total DESC, i.ingresos_total DESC
LIMIT 5;

-- Cálculo de ingresos por producto y luego se relacionará con la ubicación
WITH ingresos_por_producto AS (
    SELECT
        p.ProductID,
        SUM(sod.LineTotal) AS ingresos_total
    FROM Production_Product p
    INNER JOIN Sales_SalesOrderDetail sod ON p.ProductID = sod.ProductID
    GROUP BY p.ProductID
),

-- Relacionar los ingresos por producto con la ubicación
ingresos_por_ubicacion AS (
    SELECT
        pi.LocationID,
        l.Name AS nombre_ubicacion,
        SUM(ipp.ingresos_total) AS ingresos_total
    FROM Production_ProductInventory pi
    INNER JOIN Production_Location l ON pi.LocationID = l.LocationID
    INNER JOIN ingresos_por_producto ipp ON pi.ProductID = ipp.ProductID
    GROUP BY pi.LocationID, l.Name
),

-- Cálculo de producción por ubicación
produccion_por_ubicacion AS (
    SELECT
        pi.LocationID,
        l.Name AS nombre_ubicacion,
        SUM(pi.Quantity) AS cantidad_producida
    FROM Production_ProductInventory pi
    INNER JOIN Production_Location l ON pi.LocationID = l.LocationID
    GROUP BY pi.LocationID, l.Name
)

-- Resultado final
SELECT
    i.nombre_ubicacion,
    i.ingresos_total,
    p.cantidad_producida
FROM ingresos_por_ubicacion i
INNER JOIN produccion_por_ubicacion p ON i.LocationID = p.LocationID
ORDER BY i.ingresos_total DESC
LIMIT 5;


