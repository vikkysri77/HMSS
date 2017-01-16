
TRUNCATE customer_order

SELECT * FROM customer_order
DESC customer_order
SELECT * FROM seat_status

SELECT CURRENT_TIMESTAMP()
SELECT COUNT(item_id) FROM customer_order WHERE item_id=4 

SELECT TIME(order_date) FROM customer_order
SELECT * FROM customer_order WHERE order_date BETWEEN (CURDATE(), "05:12:00") AND (CURDATE(), "05:13:15") 
UPDATE seat_status SET STATUS=FALSE WHERE seat_status.`id`=1
SELECT order_date FROM customer_order WHERE TIME(order_Date) BETWEEN ('05:00:00') AND ('05:13:07')

INSERT INTO seat_status (seatnumber)VALUES ('seat_eleven')
DELETE FROM seat_status WHERE id=11
SELECT * FROM seat_status
TRUNCATE seat_status
SELECT id FROM food_items WHERE id BETWEEN 1 AND 7