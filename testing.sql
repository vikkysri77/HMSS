
TRUNCATE customer_order

SELECT * FROM customer_order
DESC customer_order
SELECT * FROM seat_status
SELECT * FROM stock_details


UPDATE stock_details SET remaining_quantity=(SELECT r) WHERE stock_details.`item_id`=1;


USE test
SELECT remaining_quantity FROM stock_details