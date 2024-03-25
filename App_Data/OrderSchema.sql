DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS OrderForm;
DROP TABLE IF EXISTS PaymentInfo;

-- OrderForm Table
CREATE TABLE OrderForm (
    orderID VARCHAR(50) NOT NULL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    orderStatus VARCHAR(50) NOT NULL,
    orderTotal FLOAT NOT NULL DEFAULT 0,
    orderDate DATE NOT NULL,
    orderTime TIME NOT NULL,
    returnDate DATE NOT NULL,
    FOREIGN KEY (username) REFERENCES Users(username),
    CONSTRAINT CHK_orderStatus CHECK (orderStatus IN ('Order Placed', 'Preparing to Ship', 'In Transit', 'Delivered', 'To Return'))
);

-- OrderItems Table
CREATE TABLE OrderItems (
	orderID VARCHAR(50) NOT NULL,
	prodID VARCHAR(5) NOT NULL,
	price FLOAT NOT NULL,
	FOREIGN KEY (prodID) REFERENCES Products(prodID),
);

-- PaymentInfo Table
CREATE TABLE PaymentInfo (
    orderID VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    cardName VARCHAR(100) NOT NULL,
    cardNum VARCHAR(100) NOT NULL,
    FOREIGN KEY (username) REFERENCES Users(username),
);