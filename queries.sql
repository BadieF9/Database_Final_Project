-- 1
SELECT MAX(price) FROM foods WHERE price < (SELECT MAX(price) FROM foods);

-- 2
SELECT * FROM rooms GROUP BY bed_number;

-- 3
SELECT first_name FROM rooms
LEFT JOIN floor_worker ON rooms.floor_id = floor_worker.floor_id
GROUP BY worker_id;

-- 4
CREATE PROCEDURE SelectAllFoods @FoodNumber INT
AS
SELECT * FROM food_numbers WHERE FoodNumber = @FoodNumber
GO;
EXEC SelectAllFoods @FoodNumber = 5;

-- 5
SELECT order_id FROM food_numbers
UNION
SELECT order_id FROM order_table
ORDER BY order_id;

-- 6 
SELECT COUNT(DISTINCT name) FROM foods;

-- 7 
SELECT table_capacity, restaurant_id
FROM restaurant_tables
WHERE reserved = TRUE
GROUP BY table_capacity, restaurant_id
ORDER BY table_capacity, restaurant_id

-- 8
CREATE PROCEDURE TableCheck @ReservationCheck BOOLEAN
AS
SELECT * FROM restaurant_tables WHERE ReservationCheck = @ReservationCheck
GO;
EXEC TableCheck @ReservationCheck = True;