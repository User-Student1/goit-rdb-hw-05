Homework #5 — Nested Queries and Code Reuse

Writing nested queries (subqueries) in SELECT, WHERE and FROM, rewriting a FROM subquery as a temporary table with WITH, and creating a reusable FLOAT division function applied to order data.

Files
hw05_queries.sql — all SQL code (tasks 1–5)
p1_select_subquery.png — Task 1: order_details with customer_id from orders via a subquery in SELECT
p2_where_subquery.png — Task 2: order_details filtered by orders with shipper_id = 3 via a subquery in WHERE
p3_from_subquery.png — Task 3: subquery in FROM selecting quantity > 10, average quantity grouped by order_id
p4_with_cte.png — Task 4: same as Task 3 using WITH and the temporary table temp
p5_1_create_function.png — Task 5: divide_float function created with DROP FUNCTION IF EXISTS
p5_2_apply_function.png — Task 5: divide_float applied to quantity (divisor 2.5)
Database used (shop_id)
orders (id, customer_id, employee_id, date, shipper_id)
order_details (id, order_id, product_id, quantity)
Function
divide_float(dividend FLOAT, divisor FLOAT) RETURNS FLOAT — divides the first parameter by the second; NULLIF prevents division by zero
