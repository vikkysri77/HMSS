DROP PROCEDURE IF EXISTS customer_order;
DELIMITER $$
CREATE PROCEDURE customer_order(customer_id1 INT,item_id1 INT,quantity1 INT)
BEGIN
SET @cd=customer_id1;
SET @td=(SELECT id FROM food_items WHERE id=item_id1);
SET @qty=quantity1;
SET @sd=(SELECT stock FROM food_items WHERE id=@td);

/*if condition 2 to check if the item is in the menu*/
IF (SELECT id FROM food_items WHERE food_items.`id`=@td ) THEN

	/*if condition 3 to check quantity*/
		IF ((@sd-@qty)>0) THEN
		/* if condition 1 to restric order of 5 items only*/
			IF ((SELECT COUNT(item_id) FROM customer_order WHERE item_id=@td AND customer_id=@cd)<5) THEN
				
	/*case condition to check the avaialbility of food based on time and then take order*/
	CASE @td
	WHEN @td BETWEEN 1 AND 7 THEN 
		IF (CURRENT_TIME() BETWEEN '08:00:00' AND '11:00:00') THEN
		INSERT INTO customer_order (customer_id,item_id,quantity) VALUES (@cd,@td,@qty);
		SELECT 'order confirmed';
		ELSE
		SELECT 'item not available at this time' ;
		END IF;
	WHEN @td<8 AND @td>10 THEN
		IF (CURRENT_TIME() BETWEEN '11:15:00' AND '15:00:00') THEN
		INSERT INTO customer_order (customer_id,item_id,quantity) VALUES (@cd,@td,@qty);
		END IF;
	WHEN @td BETWEEN 11 AND 13 THEN
		IF (CURRENT_TIME() BETWEEN '15:15:00' AND '23:00:00') THEN 
		INSERT INTO customer_order (customer_id,item_id,quantity) VALUES (@cd,@td,@qty);
		SELECT 'order confirmed' ;
		ELSE
		SELECT 'item not available at this time' ;
		END IF;
	
	WHEN @td BETWEEN 14 AND 16 THEN
		IF (SELECT order_date FROM customer_order WHERE TIME(order_Date) BETWEEN '19:00:00' AND '23:00:00') THEN
		INSERT INTO customer_order (customer_id,item_id,quantity) VALUES (@cd,@td,@qty);
		SELECT 'order confirmed' ;
		ELSE
		SELECT 'item not available at this time' ;
		END IF;

	END CASE;
				ELSE 
				SELECT " sorry only 5 items";
			END IF;
		/*end of if condition 1*/
		ELSE 
		SELECT "ordered quantity is exceeding the stock limit";
		END IF;
	/*end of if condition 3*/
	
ELSE
SELECT "enter a valid item from the menu";
END IF;
/*end of if condition 2*/


END$$
DELIMITER ;


CALL customer_order(2,8,20);







