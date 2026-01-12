-- Furniture → ProductID 1
UPDATE sales_data
SET product_id = 1
WHERE Category = 'Furniture'
AND OrderID IS NOT NULL;

-- Technology → ProductID 4
UPDATE sales_data
SET product_id = 4
WHERE Category = 'Technology'
AND OrderID IS NOT NULL;

-- Clothing → ProductID 3
UPDATE sales_data
SET product_id = 3
WHERE Category = 'Clothing'
AND OrderID IS NOT NULL;
SELECT OrderID, Category, product_id, Sales FROM sales_data;
SELECT 
    s.OrderID,
    s.OrderDate,
    s.Category,
    p.ProductName,
    s.State,
    s.Sales,
    s.Quantity
FROM sales_data s
JOIN products p
ON s.product_id = p.product_id;
SELECT 
    p.ProductName,
    SUM(s.Sales) AS Total_Sales
FROM sales_data s
JOIN products p
ON s.product_id = p.product_id
GROUP BY p.ProductName
ORDER BY Total_Sales DESC;

SELECT 
    p.ProductName,
    COUNT(s.OrderID) AS Number_of_Orders
FROM sales_data s
JOIN products p
ON s.product_id = p.product_id
GROUP BY p.ProductName
ORDER BY Number_of_Orders DESC;

SELECT 
    s.State,
    p.ProductName,
    SUM(s.Sales) AS Total_Sales
FROM sales_data s
JOIN products p
ON s.product_id = p.product_id
GROUP BY s.State, p.ProductName
ORDER BY s.State, Total_Sales DESC;

SELECT 
    OrderID,
    ProductName,
    Sales,
    CASE
        WHEN Sales >= 1000 THEN 'High'
        WHEN Sales >= 500 THEN 'Medium'
        ELSE 'Low'
    END AS Sales_Category
FROM sales_data s
JOIN products p
ON s.product_id = p.product_id;

SELECT 
    s.OrderID,
    p.ProductName,
    s.Category,
    s.Sales
FROM sales_data s
JOIN products p
ON s.product_id = p.product_id
WHERE s.Sales > (
    SELECT AVG(Sales)
    FROM sales_data
    WHERE Category = s.Category
);


SELECT 
    s.Category,
    COUNT(s.OrderID) AS Number_of_Orders,
    CASE
        WHEN SUM(s.Sales) >= 1000 THEN 'High Sales'
        WHEN SUM(s.Sales) >= 500 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS Sales_Category
FROM sales_data s
GROUP BY s.Category
ORDER BY Number_of_Orders DESC;

SELECT 
    s.OrderID,
    p.ProductName,
    s.Category,
    s.Sales
FROM sales_data s
JOIN products p
ON s.product_id = p.product_id
WHERE s.Sales > (
    SELECT AVG(Sales)
    FROM sales_data
    WHERE Category = s.Category
);

SELECT 
    s.State,
    p.ProductName,
    SUM(s.Sales) AS Total_Sales
FROM sales_data s
JOIN products p
ON s.product_id = p.product_id
GROUP BY s.State, p.ProductName
ORDER BY s.State, Total_Sales DESC;


