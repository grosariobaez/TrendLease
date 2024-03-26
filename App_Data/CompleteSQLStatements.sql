DROP TABLE IF EXISTS ProductRating;
DROP TABLE IF EXISTS PaymentInfo;
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS OrderForm;
DROP TABLE IF EXISTS CartItems;
DROP TABLE IF EXISTS WishListItems;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS InfoUsers;
DROP TABLE IF EXISTS AuthUsers;
DROP TABLE IF EXISTS Users;

-- Users Table
CREATE TABLE Users (
    username VARCHAR(50) NOT NULL PRIMARY KEY
);

-- AuthUsers Table
CREATE TABLE AuthUsers (
    username VARCHAR(50) NOT NULL,
    userPass VARCHAR(50) NOT NULL,
    FOREIGN KEY (username) REFERENCES Users(username)
);

-- InfoUsers Table
CREATE TABLE InfoUsers (
    username VARCHAR(50) NOT NULL,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    userAddress VARCHAR(100) NOT NULL,
    phoneNum VARCHAR(11) NOT NULL,
    emailAdd VARCHAR(100) NOT NULL,
    orderNum INT NOT NULL DEFAULT '1',
    FOREIGN KEY (username) REFERENCES Users(username)
);

-- Products Table
CREATE TABLE Products (
    prodID VARCHAR(5) NOT NULL PRIMARY KEY,
    prodName VARCHAR(50) NOT NULL,
    prodDesc VARCHAR(255) NOT NULL,
    prodType VARCHAR(50) NOT NULL,
    prodPrice FLOAT NOT NULL,
    prodAvail BIT NOT NULL
);

INSERT INTO Products (prodID, prodName, prodDesc, prodType, prodPrice, prodAvail) VALUES 
('00001', 'Denim Jacket', 'Classic denim jacket with button closure', 'Apparel', 600, 'true'),
('00002', 'Graphic T-Shirt', 'Cotton t-shirt with printed graphic design', 'Apparel', 350, 'true'),
('00003', 'Straight-leg Jeans', 'High-rise straight-leg jeans with comfortable fabric', 'Bottoms', 550, 'true'),
('00004', 'Wide-Leg Trousers', 'High-waist wide-leg trousers with belt', 'Bottoms', 350, 'true'),
('00005', 'Leather Jacket', 'Classic leather moto jacket with zip closure', 'Apparel', 1200, 'true'),
('00006', 'Knit Sweater', 'Chunky knit sweater with ribbed cuffs', 'Apparel', 850, 'true'),
('00007', 'Loafer Shoes', 'Black leather loafers with tassel detail', 'Footwear', 450, 'true'),
('00008', 'Fashionable Handbag', 'Stylish handbag with synthetic materials', 'Bags', 800, 'true'),
('00009', 'Long Sleeve Turtle Neck Shirt', 'Black long-sleeve made of soft, stretchy fabric', 'Apparel', 700, 'true'),
('00010', 'Essential Shirt Khaki', 'Khaki shirt featuring relaxed fit and smooth fabric', 'Apparel', 650, 'true'),
('00011', 'Blue Sport Shorts', 'Sport shorts with smooth texture for any active pursuit', 'Bottoms', 500, 'true'),
('00012', 'Beige Casual Shorts', 'Casual shorts made of breathable fabric for all-day comfort', 'Bottoms', 500, 'true'),
('00013', 'White Sneakers', 'White sneakers made with comfortable and versatile materials', 'Footwear', 750, 'true'),
('00014', 'Flat Sandals', 'Soft leather flat sandals ensure comfort for daily wear', 'Footwear', 700, 'true'),
('00015', 'Graphic Tote Bag', 'Carry your essentials in style with this graphic tote bag', 'Bags', 400, 'true'),
('00016', 'Black Stiletto Heels', 'Sharp and stylish black stilettos, perfect for any occasion', 'Footwear', 800, 'true'),
('00017', 'Puffy Winter Jacket', 'Cozy warmth for cold days', 'Apparel', 900, 'true'),
('00018', 'Purple Pants', 'Stylish pants, sleek, comfortable, and eye-catching', 'Bottoms', 800, 'true'),
('00019', 'Sleeveless Tank Top', 'Perfect for staying cool and stylish in warm weather', 'Apparel', 200, 'true'),
('00020', 'Classic Green Clogs Sandal', 'Elevate your summer look with these stylish and comfortable sandals', 'Footwear', 300, 'true'),
('00021', 'Green Duffel Bag', 'Perfect for sports, with plenty of room for all your gear', 'Bags', 750, 'true'),
('00022', 'Brown Suede Skirt', 'Elevate your wardrobe perfect for both casual and formal occasions', 'Bottoms', 550, 'true'),
('00023', 'Red Crop Top', 'Stand out in style with this vibrant red crop top', 'Apparel', 400, 'true'),
('00024', 'Linen Shirt', 'Stay cool and classy in this timeless linen shirt', 'Apparel', 600, 'true'),
('00025', 'Basic Green Linen Shorts', 'Keep it casual with these essential linen shorts', 'Bottoms', 300, 'true'),
('00026', 'Luxury Clutch Bag', 'This glamorous clutch bag embodies luxury, perfect for upscale events', 'Bags', 800, 'true'),
('00027', 'Red High-Top Sneakers', 'Bold and stylish, these sneakers are the perfect piece for any outfit', 'Footwear', 950, 'true'),
('00028', 'Drawstring Bag', 'Effortlessly carry your essentials, ideal for on-the-go lifestyles', 'Bags', 350, 'true'),
('00029', 'Pink Long Skirt', 'Elevate your style with this versatile long skirt, suitable for any occasion', 'Bottoms', 700, 'true'),
('00030', 'Light Down Jacket', 'Bundle up in style with this lightweight and warm down jacket', 'Apparel', 850, 'true');


-- WishListItems Table
CREATE TABLE WishListItems (
    username VARCHAR(50) NOT NULL,
    prodID VARCHAR(5) NOT NULL
);

-- CartItems Table
CREATE TABLE CartItems (
    username VARCHAR(50) NOT NULL,
    prodID VARCHAR(5) NOT NULL
);

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
    CONSTRAINT CHK_orderStatus CHECK (orderStatus IN ('Order Placed', 'Preparing to Ship', 'In Transit', 'Delivered', 'To Return', 'Completed'))
);

-- OrderItems Table
CREATE TABLE OrderItems (
    orderID VARCHAR(50) NOT NULL,
    prodID VARCHAR(5) NOT NULL,
    price FLOAT NOT NULL,
    FOREIGN KEY (orderID) REFERENCES OrderForm(orderID),
    FOREIGN KEY (prodID) REFERENCES Products(prodID)
);

-- PaymentInfo Table
CREATE TABLE PaymentInfo (
    orderID VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    cardName VARCHAR(100) NOT NULL,
    cardNum VARCHAR(100) NOT NULL,
    FOREIGN KEY (username) REFERENCES Users(username)
);

-- ProductRating Table
CREATE TABLE ProductRating (
    prodID VARCHAR(5) NOT NULL,
    userRating FLOAT DEFAULT NULL,
    FOREIGN KEY (prodID) REFERENCES Products(prodID)
);

INSERT INTO ProductRating (prodID) 
VALUES 
('00001'), ('00002'), ('00003'), ('00004'), ('00005'), ('00006'), ('00007'), ('00008'),
('00009'), ('00010'), ('00011'), ('00012'), ('00013'), ('00014'), ('00015'), ('00016'),
('00017'), ('00018'), ('00019'), ('00020'), ('00021'), ('00022'), ('00023'), ('00024'),
('00025'), ('00026'), ('00027'), ('00028'), ('00029'), ('00030');

-- INSERT INTO ProductRating (prodID) VALUES ('00001', '00002', '00003', '00004','00005','00006','00007','00008','00009','00010', '00011','00012','00013','00014', '00015', '00016', '00017', '00018', '00019', '00020', '00021','00022', '00023', '00024', '00025', '00026', '00027','00028', '00029', '00030');