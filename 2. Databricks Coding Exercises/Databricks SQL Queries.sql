--Query 1: View of first 10 rows of the table, to check if table is reflecting correctly
Select*
From workspace.default.bright_coffee_shop_exercise
Limit 10;


--Query 2: View distinct store locations
Select distinct store_location
From workspace.default.bright_coffee_shop_exercise;


--Query 3: Select specific columns
Select distinct transaction_id,
                product_category,
                unit_price
From workspace.default.bright_coffee_shop_exercise
Limit 20;


--Query 4: Using a column alias
Select product_category AS Category,
       unit_price AS Price
From workspace.default.bright_coffee_shop_exercise
limit 100;


--Query 5: Filtering using Where
Select *
From workspace.default.bright_coffee_shop_exercise
Where product_category = 'Coffee';


--Query 6: Filtering using Where and And
Select*
From workspace.default.bright_coffee_shop_exercise
Where product_category = 'coffee beans'
AND unit_price > 10;


--Query 7: Finding the minimum unit price 
Select MIN(unit_price) AS Min_Price
From workspace.default.bright_coffee_shop_exercise;


--Query 8: Filtering using Where and OR
Select*
From workspace.default.bright_coffee_shop_exercise
Where product_category ='Coffee'
OR product_category ='Tea';


--Query 9: Finding the maximum unit price
Select MAX(unit_price) AS Max_Price
FROM workspace.default.bright_coffee_shop_exercise;


--Query 10: Filtering using Where and IN
Select *
From workspace.default.bright_coffee_shop_exercise
Where product_category IN ('Coffee','Tea');


--Query 11: Sorting results
Select product_category,
       unit_price
From workspace.default.bright_coffee_shop_exercise
Order By unit_price DESC;


--Query 12: Counting total transactions
Select COUNT(*)
From workspace.default.bright_coffee_shop_exercise;


--Query 13: Calculate total sales
Select SUM(transaction_qty* unit_price) AS Total_Sales
From workspace.default.bright_coffee_shop_exercise;

--Query 14: Calculate minimum and maximum price
Select MIN(unit_price) AS cheapest_item,
       MAX(unit_price) AS most_expensive_item
From workspace.default.bright_coffee_shop_exercise;

--Query 15: Total sales per category
Select product_category,
       SUM(transaction_qty* unit_price) AS Total_Sales
From workspace.default.bright_coffee_shop_exercise
Group By product_category
Order By Total_sales DESC;


