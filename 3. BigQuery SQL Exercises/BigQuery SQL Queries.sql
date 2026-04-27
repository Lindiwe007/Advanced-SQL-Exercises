-- Query 0: Limit rows to 1000
SELECT *
FROM `practical-3-big-query-494617.Practical_retailsales.Data`
LIMIT 1000;

-- Query 1: Filter all transactions that occurred in the year 2023
SELECT *
FROM `practical-3-big-query-494617.Practical_retailsales.Data`
WHERE EXTRACT(YEAR FROM DATE(`Date`)) = 2023;

-- Query 2: Filtering and Conditions - to see transactions which are more than the average
SELECT * FROM `practical-3-big-query-494617.Practical_retailsales.Data`
WHERE`Total Amount` > (SELECT AVG(`Total Amount`) FROM `practical-3-big-query-494617.Practical_retailsales.Data`)
;

--Query 3: Aggregate Functions to find the total revenue = 456 000
SELECT
  SUM(`Total Amount`) AS Total_Revenue
FROM `practical-3-big-query-494617.Practical_retailsales.Data`;


--Query 4: Distinct to show distinct product categories
SELECT DISTINCT`Product Category` AS Product_Category
FROM `practical-3-big-query-494617.Practical_retailsales.Data`
ORDER BY Product_Category;

--Query 5: Group By to show total quantity sold per product category
SELECT`Product Category` AS Product_Category,
  SUM(Quantity) AS Total_Quantity
FROM `practical-3-big-query-494617.Practical_retailsales.Data`
GROUP BY Product_Category
ORDER BY Total_Quantity DESC;

--Query 6: Case Statement to create customer age group
SELECT`Customer ID` AS Customer_ID,Age,
  CASE
    WHEN Age < 30 THEN 'Youth'
    WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
    ELSE 'Senior'
  END AS Age_Group
FROM `practical-3-big-query-494617.Practical_retailsales.Data`;

--Query 7: Conditional Aggregation to show high value transactions per gender
SELECT Gender,
 COUNTIF(`Total Amount` > 500) AS High_Value_Transactions
FROM `practical-3-big-query-494617.Practical_retailsales.Data`
GROUP BY Gender
ORDER BY High_Value_Transactions DESC;

--Query 8: Having Clause to show categories with revenue exceeding 5000
SELECT`Product Category` AS Product_Category,
  SUM(`Total Amount`) AS Total_Revenue
FROM `practical-3-big-query-494617.Practical_retailsales.Data`
GROUP BY Product_Category
HAVING SUM(`Total Amount`) > 5000
ORDER BY Total_Revenue DESC;

--Query 9: Calculated Fields to show new column classifying transactions as cheap, moderate or expensive
SELECT`Transaction ID` AS Transaction_ID,
  `Price per Unit` AS Price_per_Unit,
  CASE
    WHEN `Price per Unit` < 50 THEN 'Cheap'
    WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
    ELSE 'Expensive'
  END AS Unit_Cost_Category
FROM `practical-3-big-query-494617.Practical_retailsales.Data`;

--Query 10: Combining WHERE + CASE to display all transactions from customers aged 40 and older
SELECT`Customer ID` AS Customer_ID,
  Age,`Total Amount` AS Total_Amount,
  CASE
    WHEN `Total Amount` > 1000 THEN 'High'
    ELSE 'Low'
  END AS Spending_Level
FROM `practical-3-big-query-494617.Practical_retailsales.Data`
WHERE Age >= 40;
