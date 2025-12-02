#Write a query to count the total number of startups in the database.

USE failed_startups_db;
SELECT count(*) startup
FROM startups;

#Write a query to display the total number of failed startups
#for each sector along with the average amount of money that 
#is raised in each sector. Sort the result set by average amount
# of money raised in descending order.

USE failed_startups_db;
SELECT sectors, COUNT(startup_id) AS 'Total_failed_startups',
CONCAT(ROUND(AVG(hmr.how_much_raised) / 1000000), ' million dollars raised on average') AS 'avg_amount_raised'
FROM startups
JOIN sectors ON startups.sectors_id = sectors.sectors_id
JOIN how_much_raised hmr ON startups.how_much_raised_id = hmr.how_much_raised_id
GROUP BY sectors
ORDER BY avg_amount_raised DESC;

#Rap Genius (2014-2020) had six reasons for going out of business: giants, no budget, monetization failure, trend flaws, 
#platform dependency, and regulatory pressure. Write a query that returns startups that had at least six reasons for their failure. 
#Sort the result set by the number of failure factors in descending order.

USE failed_startups_db;
SELECT startup, SUM(ff.giants + ff.no_budget + ff.competition + ff.poor_market_fit + ff.acquisition_stagnation
+ ff.high_operational_costs + ff.monetization_failure + ff.niche_limits + ff.execution_flaws + ff.trend_flaws + ff.platform_dependency
+ ff.toxicity_trust_issues + ff.regulatory_pressure + ff.overhype) AS total_failure_factors
FROM startups
JOIN failure_factors ff ON startups.factor_id = ff.factor_id
GROUP BY startup
HAVING total_failure_factors >= 6
ORDER BY total_failure_factors DESC;

#Write a query that displays the average number of years startups survive in each sector, 
#with the result rounded to one decimal place, along with the earliest year of the first startup in each sector. 
#Sort the result set by average number of years in descending order.

USE failed_startups_db;
SELECT sectors, ROUND(AVG(yoo.number_of_years), 1) AS avg_number_of_years, MIN(yoo.start_year) AS earliest_start_year
FROM startups
JOIN sectors ON startups.sectors_id = sectors.sectors_id
JOIN years_of_operation yoo ON startups.years_of_operation_id = yoo.years_of_operation_id
GROUP BY sectors
ORDER BY avg_number_of_years DESC;

#Write a query that displays the number of companies whose failure is associated with each takeaway. 
#Only include takeaways with at least five companies. Sort the result set by the number of companies in descending order.

USE failed_startups_db;
SELECT takeaway, count(startup) AS total_num_of_startups
FROM startups s
JOIN takeaways t ON s.takeaway_id = t.takeaway_id
GROUP BY takeaway
HAVING COUNT(startup) >= 5
ORDER BY total_num_of_startups DESC, takeaway ASC;





