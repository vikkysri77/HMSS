/*trigger to restrict no of status*/

DROP TRIGGER IF EXISTS tr1;
DELIMITER $$
CREATE TRIGGER tr1
BEFORE INSERT
ON customer_order
FOR EACH ROW
BEGIN
SET @md=(SELECT customer_id FROM customer_order);
UPDATE seat_status SET seat_state=TRUE WHERE seat_status.`seat_id`=@md;
UPDATE customer_order SET seat_number=@md WHERE customer_order.`customer_id`=
END$$
DELIMITER ;


DROP TRIGGER IF EXISTS tr2;
DELIMITER $$
CREATE TRIGGER tr2
AFTER INSERT 
ON customer_order
FOR EACH ROW
BEGIN
SET @dd=(SELECT item_id FROM customer_order);
SET @ld=((SELECT remaining_quantity FROM stock_details WHERE stock_details.`item_id`=@dd)
-(SELECT quantity FROM customer_order ));

UPDATE stock_details SET remaining_quantity=@ld WHERE stock_details.`item_id`=@dd;
END $$
DELIMITER ;





