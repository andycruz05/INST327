USE pizza_db;

SELECT order_id, pizza_name, quantity, category, price, ingredients
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
WHERE order_id = 2;

/*-----------------------*/

USE pizza_db; 

SELECT pizza_id, pizza_name, size, price AS 'price $12 or less', ingredients
FROM pizzas

JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
WHERE size = 'S' AND price <= '12';

/*--------------------------*/

USE pizza_db;

SELECT pizza_name, ingredients
FROM pizza_types

WHERE ingredients LIKE '%Kalamata Olives%'
ORDER BY pizza_name ASC;

/*------------------*/

USE pizza_db;

SELECT
  CASE
    WHEN ingredients LIKE '%Mushrooms%'
      THEN CONCAT(pizza_name, ' contains mushrooms.')
    ELSE
      CONCAT(pizza_name, ' does not contain mushrooms.')
  END AS mushrooms_in_pizza
FROM pizza_types
ORDER BY pizza_name ASC;

/*------------------------*/

USE pizza_db;

SELECT CONCAT('Order #', order_id,
 ' was placed on ', DATE_FORMAT(date, '%W, %M %e, %Y'),
 ' at ', DATE_FORMAT(time, '%r')) AS orders_on_christmas_eve
FROM orders
WHERE date = '2015-12-24'
ORDER BY time;



