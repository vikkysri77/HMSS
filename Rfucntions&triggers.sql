/*trigger to restrict no of status*/

DROP TRIGGER IF EXISTS tr1;
DELIMITER $$
CREATE TRIGGER tr1
BEFORE INSERT
ON customer_order
FOR EACH ROW
BEGIN

UPDATE seat_status SET STATUS=TRUE WHERE seat_status.`id`=1;

END;
END$$
DELIMITER ;
