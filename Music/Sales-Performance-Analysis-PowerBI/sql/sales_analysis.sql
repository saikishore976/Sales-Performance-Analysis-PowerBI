-- Clean data
SELECT *
FROM sales_data
WHERE Order_ID IS NOT NULL
AND Sales IS NOT NULL;

-- Total Revenue
SELECT SUM(Sales) AS Total_Revenue
FROM sales_data;

-- Revenue by Region
SELECT Region, SUM(Sales) AS Revenue
FROM sales_data
GROUP BY Region
ORDER BY Revenue DESC;

-- Top Products
SELECT Product_Name, SUM(Sales) AS Product_Revenue
FROM sales_data
GROUP BY Product_Name
ORDER BY Product_Revenue DESC;

-- Monthly Revenue Trend
SELECT 
    FORMAT(Order_Date, 'yyyy-MM') AS Month,
    SUM(Sales) AS Monthly_Revenue
FROM sales_data
GROUP BY FORMAT(Order_Date, 'yyyy-MM')
ORDER BY Month;

-- Average Order Value
SELECT AVG(Sales) AS Avg_Order_Value
FROM sales_data;

-- Underperforming Segments
SELECT Category, SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Category
HAVING SUM(Profit) < 0;
