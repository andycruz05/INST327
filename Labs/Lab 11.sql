#Write a query that uses a subquery in the WHERE clause. Explain what the result set shows, and submit the query below.

USE richest_companies_db;
SELECT Company, Current_Price
FROM Companies
WHERE Current_price >
	(SELECT AVG(Current_Price)
    FROM Companies);
    
#Write a query that uses a subquery in the FROM clause. Explain what the result set shows, and submit the query below.

USE richest_companies_db;
SELECT Company, Current_Price
FROM (
        SELECT Company, Current_Price
        FROM Companies
     ) P
WHERE Current_Price > 350;

#Rewrite the query from the previous question using a common table expression instead of a subquery. 
#It should produce the same result set. Submit the query below.

USE richest_companies_db;
WITH ptable AS (
    SELECT Company, Current_Price
    FROM Companies
)

SELECT Company, Current_Price
FROM ptable
WHERE Current_Price > 500;

#Use ROW_NUMBER(), RANK(), or DENSE RANK

USE richest_companies_db;
SELECT 
    Company,
    Current_Price,
    ROW_NUMBER() OVER (ORDER BY Current_Price DESC) AS Price_Rank
FROM Companies;
    
