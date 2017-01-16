/*Table for fooditems*/
CREATE TABLE food_items(
id INT PRIMARY KEY NOT NULL,
item_name VARCHAR(100),
item_type ENUM('Breakfast','Lunch','Refreshments','Dinner'),
stock INT
)

INSERT INTO food_items VALUES
(1,'Idly','Breakfast',100),
(2,'Vada','Breakfast',100),
(3,'Dosa','Breakfast',100),
(4,'Poori','Breakfast',100),
(5,'Pongal','Breakfast',100),
(6,'Coffee','Breakfast',100),
(7,'Tea','Breakfast',100),

(8,'SouthIndianMeals','Lunch',75),
(9,'NorthIndianThali','Lunch',75),
(10,'VariteyRice','Lunch',100),

(11,'Coffee','Refreshments',200),
(12,'Tea','Refreshments',200),
(13,'Snacks','Refreshments',200),

(14,'FriedRice','Dinner',100),
(15,'Chapatti','Dinner',100),
(16,'ChatItems','Dinner',100)


SELECT * FROM food_items


-------------------------------------------------------------------------------
/* Table for seats*/

CREATE TABLE seat_status(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
seatnumber VARCHAR(100),
STATUS BOOLEAN NOT NULL DEFAULT 0
)
INSERT INTO seat_status (seatnumber) VALUES
('seat_one'),
('seat_two'),
('seat_three'),
('seat_four'),
('seat_five'),
('seat_six'),
('seat_seven'),
('seat_eight'),
('seat_nine'),
('seat_ten')
SELECT * FROM seat_status

-------------------------------------------------------------------------------

CREATE TABLE customer_order (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL, 
item_id INT NOT NULL,
quantity INT NOT NULL,
order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
seat_number INT,
CONSTRAINT fkey1 FOREIGN KEY (seat_number) REFERENCES seat_status(id),
CONSTRAINT fkey2 FOREIGN KEY (item_id) REFERENCES food_items(id)
)


SELECT * FROM customer_order


-------------------------------------------------------------------------------




/*Table for order_details*/

CREATE TABLE stock_details(
id INT AUTO_INCREMENT,
item_name VARCHAR(100),
item_type ENUM('Breakfast','Lunch','Refreshments','Dinner'), 

)
