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
				INSERT INTO customer_order (customer_id,item_id,quantity) VALUES (@cd,item_id1,quantity1); 
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