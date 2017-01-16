DROP PROCEDURE IF EXISTS customer_order;
DELIMITER $$
CREATE PROCEDURE customer_order(customer_id1 INT,item_id1 VARCHAR(100),quantity1 INT)
BEGIN
SET @cd=customer_id1;
SET @td=item_id1;
SET @qty=quantity1;
SET @sd=(SELECT stock FROM food_items WHERE id=@td);

/*if condition 2 to check if the item is in the menu*/
IF (SELECT id FROM food_items WHERE food_items.`id`=@td ) THEN

	/*if condition 3 to check quantity*/
		IF ((@sd-@qty)>0) THEN
		/* if condition 1 to restric order of 5 items only*/
			IF ((SELECT COUNT(item_id) FROM customer_order WHERE item_id=@td AND customer_id=@cd)<5) THEN
				
	/*case condition to check the avaialbility of food based on time and then take order*/
	CASE item_id1
	WHEN BETWEEN 1 AND 7 THEN
	IF (SELECT order_date FROM customer_order WHERE TIME(order_Date) BETWEEN ('08:00:00') AND ('11:00:00'))
	INSERT INTO customer_order (customer_id,item_id,quantity) VALUES (@cd,item_id1,quantity1);
	SELECT "order success"
	
	ELSE 
	SELECT "not available at this time";
	END IF;
	WHEN BETWEEN 8 AND 10 THEN
		IF (SELECT order_date FROM customer_order WHERE TIME(order_Date) BETWEEN ('11:15:00') AND ('15:00:00'))
		INSERT INTO customer_order (customer_id,item_id,quantity) VALUES (@cd,item_id1,quantity1);
	SELECT "order success"

	ELSE 
	SELECT "not available at this time";
	END IF;
	WHEN BETWEEN 11 AND 13 THEN
		IF (SELECT order_date FROM customer_order WHERE TIME(order_Date) BETWEEN ('15:15:00') AND ('23:00:00'))
		INSERT INTO customer_order (customer_id,item_id,quantity) VALUES (@cd,item_id1,quantity1);
	SELECT "order success"
	ELSE 
	SELECT "not available at this time";
	END IF;
	
	WHEN BETWEEN 14 AND 16 THEN
				IF (SELECT order_date FROM customer_order WHERE TIME(order_Date) BETWEEN ('19:00:00') AND ('23:00:00'))
		INSERT INTO customer_order (customer_id,item_id,quantity) VALUES (@cd,item_id1,quantity1);
	SELECT "order success"
	ELSE 
	SELECT "not available at this time";
	END IF;

	END CASE;
				ELSE 
				SELECT " sorry only 5 items";
			END IF;
		/*end of if condition 1*/
		ELSE 
		SELECT "ordered quantity is exceeding the stock";
		END IF;
	/*end of if condition 3*/
	
ELSE
SELECT "enter a valid item from the menu";
END IF;
/*end of if condition 2*/


END$$
DELIMITER ;


CALL customer_order(1,5,20);

CALL customer_order(1,5,70);

CALL customer_order(2,3,100);
