USE shop_id;

Завдання 1 Вкладений запит у SELECT

SELECT
    od.*,
    (SELECT o.customer_id
     FROM orders AS o
     WHERE o.id = od.order_id) AS customer_id
FROM order_details AS od;

Завдання 2 Вкладений запит у WHERE

SELECT *
FROM order_details AS od
WHERE od.order_id IN (
    SELECT o.id
    FROM orders AS o
    WHERE o.shipper_id = 3
);

Завдання 3 Вкладений запит у FROM

SELECT
    t.order_id,
    AVG(t.quantity) AS avg_quantity
FROM (
    SELECT order_id, quantity
    FROM order_details
    WHERE quantity > 10
) AS t
GROUP BY t.order_id;

Завдання 4 через WITH

WITH temp AS (
    SELECT order_id, quantity
    FROM order_details
    WHERE quantity > 10
)
SELECT
    order_id,
    AVG(quantity) AS avg_quantity
FROM temp
GROUP BY order_id;

Завдання 5.1 Функція ділення двох FLOAT-параметрів

DROP FUNCTION IF EXISTS divide_float;

DELIMITER //

CREATE FUNCTION divide_float(dividend FLOAT, divisor FLOAT)
RETURNS FLOAT
DETERMINISTIC
NO SQL
BEGIN
    RETURN dividend / NULLIF(divisor, 0);
END //

DELIMITER ;

Завдання 5.2 Застосування функції до quantity

SELECT
    id,
    order_id,
    product_id,
    quantity,
    divide_float(quantity, 2.5) AS quantity_divided
FROM order_details;


