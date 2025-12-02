#Write a query to count the total number of companies listed in the richest_companies_db.

SELECT COUNT(Company)
FROM Companies;

#Write a query that displays the number of companies from each sector 
#whose business summaries contain the words "pay" or "financ" (as in finance or financial). 
#Sort the results by the number of companies in descending order.

SELECT Sector, COUNT(*) AS num_of_companies 
FROM Companies
WHERE Business_Summary LIKE '%pay%' OR Business_Summary LIKE '%financ%'
GROUP BY Sector
ORDER BY Num_of_companies DESC;

#Write a query to display industries that have 10 or more companies.
#Sort the results by the number of companies in descending order.

SELECT Industry, COUNT(*) AS Num_of_companies
FROM Companies
GROUP BY Industry
HAVING COUNT(*) >= 10
ORDER BY Num_of_companies DESC;

#Write a query to display the average revenue growth percentage
# of companies within each industry. Only include industries that
# have at least 5 companies, and sort the results by average 
#revenue growth percentage from highest to lowest.

SELECT Industry, ROUND(AVG(Revenue_Growth_In_Pct), 2) AS Avg_sector_growth
FROM Companies
GROUP BY Industry
HAVING COUNT(*) >= 5
ORDER BY Avg_sector_growth DESC;

#Write a query to find the smallest company in each sector based on
#the number of full-time employees. Sort the results in ascending order
# by the minimum number of employees.

SELECT Sector, MIN(Fulltime_Employees) AS Min_num_of_employees_in_one_company
FROM Companies
GROUP BY Sector
ORDER BY Min_num_of_employees_in_one_company ASC;

#Write a query to display the highest current stock price for companies within each sector.
#Sort the results from highest to lowest.

SELECT Sector, MAX(Current_Price) AS Max_stock_price
From Companies
GROUP BY Sector
ORDER BY Max_stock_price DESC;







