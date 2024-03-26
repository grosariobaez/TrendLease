DROP TABLE IF EXISTS CompletedOrders

CREATE TABLE CompletedOrders (
	username VARCHAR (50) NOT NULL,
	orderID VARCHAR(50) NOT NULL,
	image_receipt VARBINARY(MAX)  
);