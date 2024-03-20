DROP TABLE IF EXISTS ProductRating;

-- Products Table
CREATE TABLE ProductRating (
	prodID VARCHAR(5),
	userRating FLOAT default 0
);

INSERT INTO ProductRating (prodID) VALUES ('00001', '00002', '00003', '00004','00005','00006','00007');