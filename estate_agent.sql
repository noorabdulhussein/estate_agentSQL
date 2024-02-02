/*script to run on MySQL- test on JHUB terminal*/

CREATE DATABASE IF NOT EXISTS `estate_agent`;
USE `estate_agent`;

DROP TABLE IF EXISTS sold;
DROP TABLE IF EXISTS forRent;
DROP TABLE IF EXISTS forSale;
DROP TABLE IF EXISTS property;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS office;
DROP TABLE IF EXISTS agency;
DROP TABLE IF EXISTS Postcode;

CREATE TABLE agency (
    Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL,
    PhoneNumber CHAR(11) NOT NULL UNIQUE CHECK (PhoneNumber LIKE '0%' AND CHAR_LENGTH(PhoneNumber) = 11)
);

CREATE TABLE Postcode (
    Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Area CHAR(1) NOT NULL CHECK (Area <> ''),
    District INT NOT NULL CHECK (District >= 1 AND District <= 9),
    Sector INT NOT NULL CHECK (Sector >= 1 AND Sector <= 9),
    Unit VARCHAR(2) NOT NULL CHECK (CHAR_LENGTH(Unit) = 2)

);

CREATE TABLE office (
    Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    AgencyId INT NOT NULL,
    FOREIGN KEY (AgencyId) REFERENCES agency(Id),
    PostcodeId INT NOT NULL,
    FOREIGN KEY (PostcodeId) REFERENCES Postcode(Id),
    PhoneNumber CHAR(11) NOT NULL UNIQUE CHECK (PhoneNumber LIKE '0%' AND CHAR_LENGTH(PhoneNumber) = 11)
);

CREATE TABLE customer (
    Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL CHECK (CHAR_LENGTH(FirstName) > 0),
    LastName VARCHAR(255) NOT NULL CHECK (CHAR_LENGTH(LastName) > 0),
    PhoneNumber VARCHAR(11) NOT NULL UNIQUE CHECK (PhoneNumber LIKE '0%' AND CHAR_LENGTH(PhoneNumber) = 11)
);

CREATE TABLE property (
    Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    PostcodeId INT NOT NULL,
    FOREIGN KEY (PostcodeId) REFERENCES Postcode(Id),
    City VARCHAR(255) NOT NULL CHECK (CHAR_LENGTH(City) > 0),
    Price DECIMAL(10, 2) NOT NULL,
    Type VARCHAR(5) NOT NULL CHECK (Type IN ('house', 'flat')),
    NumBedrooms INT NOT NULL,
    Description TEXT NOT NULL CHECK (LENGTH(Description) > 0)
);

CREATE TABLE forSale (
    PropertyId INT NOT NULL,
    OfficeId INT NOT NULL,
    FOREIGN KEY (PropertyId) REFERENCES property(Id),
    FOREIGN KEY (OfficeId) REFERENCES office(Id)
);

CREATE TABLE forRent (
    PropertyId INT NOT NULL,
    OfficeId INT NOT NULL,
    FOREIGN KEY (PropertyId) REFERENCES property(Id),
    FOREIGN KEY (OfficeId) REFERENCES office(Id)
);

CREATE TABLE sold (
    PropertyId INT NOT NULL,
    OfficeId INT NOT NULL,
    CustomerId INT NOT NULL,
    FOREIGN KEY (PropertyId) REFERENCES property(Id),
    FOREIGN KEY (OfficeId) REFERENCES office(Id),
    FOREIGN KEY (CustomerId) REFERENCES customer(Id)
);



INSERT INTO agency (NAME, PhoneNumber) VALUES ("360 Property", "02033668753");
INSERT INTO agency (NAME, PhoneNumber) VALUES ("Absolute Property", "02038666753");
INSERT INTO agency (NAME, PhoneNumber) VALUES ("Acorn", "01037666773");
INSERT INTO agency (NAME, PhoneNumber) VALUES ("Avison Young", "01322352676");
INSERT INTO agency (NAME, PhoneNumber) VALUES ("Anderson Rose", "02038723677");
INSERT INTO agency (NAME, PhoneNumber) VALUES ("Andrew Pearce", "02039078620");
INSERT INTO agency (NAME, PhoneNumber) VALUES ("Belvoir", "02083645418");
INSERT INTO agency (NAME, PhoneNumber) VALUES ("Benham & Reeves", "02045387571");
INSERT INTO agency (NAME, PhoneNumber) VALUES ("Dexters", "02088152215");
INSERT INTO agency (NAME, PhoneNumber) VALUES ("Dendrow", "02138566752");



INSERT INTO Postcode (Area, District, Sector, Unit) VALUES
    ('H', 1, 3, 'AL'),
    ('T', 6, 8, 'NO'),
    ('I', 4, 2, 'JE'),
    ('Q', 7, 5, 'TA'),
    ('V', 4, 8, 'AV'),
    ('U', 5, 7, 'XQ'),
    ('S', 8, 1, 'RL'),
    ('J', 2, 6, 'UK'),
    ('O', 2, 3, 'PP'),
    ('M', 9, 4, 'ZL'),
    ('L', 1, 9, 'YD'),
    ('D', 3, 2, 'HX'),
    ('E', 5, 7, 'VU'),
    ('W', 4, 7, 'GC'),
    ('F', 8, 6, 'IJ'),
    ('X', 6, 1, 'SE'),
    ('N', 2, 5, 'RT'),
    ('B', 7, 4, 'ZA'),
    ('A', 9, 3, 'KY'),
    ('C', 6, 9, 'MB'),
    ('G', 8, 2, 'WD'),
    ('R', 1, 7, 'PL'),
    ('Y', 3, 9, 'OU'),
    ('P', 5, 8, 'CQ'),
    ('Z', 1, 6, 'VE'),
    ('K', 7, 1, 'BM'),
    ('H', 2, 4, 'EN'),
    ('J', 6, 3, 'TC'),
    ('O', 9, 2, 'LR'),
    ('M', 5, 5, 'QN'),
    ('L', 4, 8, 'FW'),
    ('D', 3, 7, 'YX'),
    ('E', 3, 1, 'SJ'),
    ('W', 6, 5, 'CT'),
    ('F', 2, 9, 'RB'),
    ('X', 1, 1, 'GZ'),
    ('N', 8, 6, 'LO'),
    ('B', 7, 5, 'UX'),
    ('A', 9, 4, 'WC'),
    ('C', 2, 3, 'HD'),
    ('G', 1, 7, 'NA'),
    ('R', 6, 9, 'XE'),
    ('Y', 3, 2, 'OT'),
    ('P', 4, 6, 'UJ'),
    ('Z', 6, 8, 'FY'),
    ('K', 5, 1, 'MA'),
    ('H', 2, 7, 'BC'),
    ('J', 9, 3, 'QP'),
    ('O', 8, 2, 'MR'),
    ('M', 1, 6, 'LW');

INSERT INTO office(AgencyId, PostcodeId, PhoneNumber) VALUES 
    (1, 47, "02074862544"),
    (3, 26, "07859784374"),
    (5, 17, "02230632143"),
    (7, 25, "03045837576"),
    (1, 29, "06913212455"),
    (1, 15, "05381434012"),
    (3, 20, "04856341282"),
    (3, 30, "01848061211"),
    (3, 36, "06824698263"),
    (1, 5, "05880960935"),
    (6, 10, "03552276531"),
    (6, 39, "08072116962"),
    (6, 36, "03001884155"),
    (6, 1, "06860203466"),
    (3, 6, "05427044590"),
    (10, 33, "06905757500"),
    (3, 25, "07719502880"),
    (8, 21, "05447866018"),
    (8, 40, "01345404054"),
    (1, 24, "03177432789");



INSERT INTO customer(FirstName, LastName, PhoneNumber) VALUES("Alfred", "Smith", "07456746539");
INSERT INTO customer(FirstName, LastName, PhoneNumber) VALUES("Alex", "Jones", "07394785429");
INSERT INTO customer(FirstName, LastName, PhoneNumber) VALUES("Emma", "Brown", "07567893456");
INSERT INTO customer(FirstName, LastName, PhoneNumber) VALUES("Michael", "Johnson", "07678904567");
INSERT INTO customer(FirstName, LastName, PhoneNumber) VALUES("Sophia", "Miller", "07789015678");
INSERT INTO customer(FirstName, LastName, PhoneNumber) VALUES("James", "Davis", "07890126789");
INSERT INTO customer(FirstName, LastName, PhoneNumber) VALUES("Isabella", "Garcia", "07901237890");
INSERT INTO customer(FirstName, LastName, PhoneNumber) VALUES("William", "Rodriguez", "07012348901");
INSERT INTO customer(FirstName, LastName, PhoneNumber) VALUES("Olivia", "Wilson", "07123459012");
INSERT INTO customer(FirstName, LastName, PhoneNumber) VALUES("Benjamin", "Martinez", "07234560123");

INSERT INTO property (PostcodeId, City, Price, Type, NumBedrooms, Description)
VALUES
    (2, 'Torquay', 500000.00, 'house', 4, 'Spacious family home with garden'),
    (3, 'Ilford', 350000.00, 'flat', 2, 'Modern apartment with balcony'),
    (4, 'Queniborough', 750000.00, 'house', 5, 'Luxurious townhouse with parking'),
    (34, 'West London', 1200.00, 'flat', 1, 'Cozy studio apartment'),
    (37, 'North London', 9000.00, 'house', 3, 'Beautiful Victorian home'),
    (22, 'Reading', 2000.00, 'flat', 2, 'Charming apartment near Hyde Park'),
    (7, 'Sheffield', 320000.00, 'house', 3, 'Comfortable family house in a quiet neighborhood'),
    (8, 'Jersey', 450000.00, 'house', 4, 'Detached house with large garden and garage'),
    (9, 'Oxford', 275000.00, 'flat', 2, 'Contemporary city centre apartment with great views'),
    (28, 'Jersey', 2100.00, 'flat', 1, 'Stylish studio apartment in a popular area'),
    (11, 'Liverpool', 380000.00, 'house', 4, 'Spacious family home with backyard'),
    (12, 'Derby', 2800.00, 'flat', 2, 'Modern apartment in a prime location'),
    (13, 'East London', 620000.00, 'house', 3, 'Luxurious townhouse with garden and garage'),
    (14, 'West London', 1500.00, 'flat', 1, 'Cozy studio apartment in a trendy area'),
    (38, 'Birmingham', 1100000.00, 'house', 5, 'Elegant Georgian home with garden and parking'),
    (16, 'Exeter', 340000.00, 'house', 3, 'Comfortable family house in a peaceful neighborhood'),
    (27, 'Hemel Hampstead', 420000.00, 'house', 4, 'Detached house with spacious backyard'),
    (18, 'Birmingham', 2400.00, 'flat', 2, 'Chic apartment with city views'),
    (19, 'Altrincham', 510000.00, 'house', 3, 'Contemporary townhouse with a view'),
    (32, 'Derby', 1950.00, 'flat', 1, 'Sunny studio apartment in a quiet street'),
    (42, 'Reading', 720000.00, 'house', 4, 'Victorian-era home with a picturesque garden'),
    (45, 'Zetland', 330000.00, 'house', 3, 'Family-friendly house with a cozy fireplace'),
    (23, 'York', 2600.00, 'flat', 2, 'Modern apartment with balcony and gym access'),
    (44, 'Plymouth', 395000.00, 'house', 4, 'Semi-detached house with ample space'),
    (48, 'Jersey', 3100.00, 'flat', 2, 'City center apartment with stunning city views'),
    (46, 'Kingston Upon Thames', 630000.00, 'house', 3, 'Spacious townhouse with a private courtyard'),
    (37, 'North London', 1750.00, 'flat', 1, 'Contemporary studio apartment with river views'),
    (28, 'Jersey', 1250000.00, 'house', 5, 'Luxury mansion with a swimming pool and garden'),
    (22, 'Reading', 360000.00, 'house', 4, 'Family home with a spacious backyard and garage'),
    (41, 'Glasgow', 430000.00, 'house', 4, 'Detached house with a large garden and study room');



INSERT INTO forSale (PropertyId, OfficeId) VALUES (1, 1);
INSERT INTO forSale (PropertyId, OfficeId) VALUES (2, 3);
INSERT INTO forSale (PropertyId, OfficeId) VALUES (3, 7);
INSERT INTO forSale (PropertyId, OfficeId) VALUES (29, 2);
INSERT INTO forSale (PropertyId, OfficeId) VALUES (5, 4);
INSERT INTO forSale (PropertyId, OfficeId) VALUES (13, 5);
INSERT INTO forSale (PropertyId, OfficeId) VALUES (7, 10);
INSERT INTO forSale (PropertyId, OfficeId) VALUES (8, 6);
INSERT INTO forSale (PropertyId, OfficeId) VALUES (22, 8);
INSERT INTO forSale (PropertyId, OfficeId) VALUES (30, 9);


INSERT INTO forRent (PropertyId, OfficeId) VALUES (4, 9);
INSERT INTO forRent (PropertyId, OfficeId) VALUES (6, 7);
INSERT INTO forRent (PropertyId, OfficeId) VALUES (10, 1);
INSERT INTO forRent (PropertyId, OfficeId) VALUES (18, 3);
INSERT INTO forRent (PropertyId, OfficeId) VALUES (20, 2);
INSERT INTO forRent (PropertyId, OfficeId) VALUES (23, 6);
INSERT INTO forRent (PropertyId, OfficeId) VALUES (27, 8);
INSERT INTO forRent (PropertyId, OfficeId) VALUES (25, 10);
INSERT INTO forRent (PropertyId, OfficeId) VALUES (12, 4);
INSERT INTO forRent (PropertyId, OfficeId) VALUES (9, 5);


INSERT INTO sold (PropertyId, OfficeId, CustomerId) VALUES (11, 5, 3);
INSERT INTO sold (PropertyId, OfficeId, CustomerId) VALUES (14, 7, 6);
INSERT INTO sold (PropertyId, OfficeId, CustomerId) VALUES (15, 1, 1);
INSERT INTO sold (PropertyId, OfficeId, CustomerId) VALUES (16, 3, 9);
INSERT INTO sold (PropertyId, OfficeId, CustomerId) VALUES (17, 2, 10);
INSERT INTO sold (PropertyId, OfficeId, CustomerId) VALUES (19, 6, 7);
INSERT INTO sold (PropertyId, OfficeId, CustomerId) VALUES (21, 10, 8);
INSERT INTO sold (PropertyId, OfficeId, CustomerId) VALUES (24, 4, 4);
INSERT INTO sold (PropertyId, OfficeId, CustomerId) VALUES (26, 8, 5);
INSERT INTO sold (PropertyId, OfficeId, CustomerId) VALUES (28, 9, 2);



--/* Basic query 1 */:
-- Find the first 10 properties for rent, regardless of city
-- This is a basic query as it uses a INNER JOIN to connect the two tables forRent and Property
SELECT 
    p.Id AS PropertyId, 
    p.City, 
    p.Price AS RentPrice, 
    p.Type, 
    p.NumBedrooms, 
    p.Description
FROM 
    property p
INNER JOIN 
    forRent fr ON p.Id = fr.PropertyId
LIMIT 10;


--/* Basic query 2 */:
-- Find average price of flats
-- This is a basic query as it uses a function AVG calculate the average price of flats from the property table.
SELECT 
    ROUND(AVG(Price), 2) AS AveragePriceOfFlats
FROM 
    property
WHERE 
    Type = 'flat';


--/* Medium query 1 */:
-- Find the agencies who have sold one or more properties
-- This is a medium query as it uses a GROUP BY operation, complex joins (INNER JOIN and LEFT JOIN), and a HAVING clause to retrieve information about agencies, offices, and the number (COUNT function) of sold properties.
SELECT
    a.Id AS AgencyId,
    a.Name AS AgencyName,
    COUNT(s.PropertyId) AS TotalPropertiesSold
FROM
    agency a
INNER JOIN
    office o ON a.Id = o.AgencyId
LEFT JOIN
    sold s ON o.Id = s.OfficeId
GROUP BY
    a.Id, a.Name
HAVING
    TotalPropertiesSold > 0
ORDER BY
    TotalPropertiesSold DESC;


--/* Medium query 2 */:
-- Identify the 5 most expensive properties and displays the details of the estate agency in charge of it
-- This is a medium query as it uses a series of JOIN operations to display the agency's details depending on whether the propertyId is a match in the tables.
SELECT
    AgencyName,
    AgencyId,
    OfficeId,
    OfficePhoneNumber,
    PropertyId,
    PropertyValue
FROM (
    SELECT
        a.Name AS AgencyName,
        a.Id AS AgencyId,
        o.Id AS OfficeId,
        o.PhoneNumber AS OfficePhoneNumber,
        p.Id AS PropertyId,
        p.Price AS PropertyValue
    FROM
        office o
    INNER JOIN
        agency a ON o.AgencyId = a.Id
    INNER JOIN
        sold s ON o.Id = s.OfficeId
    INNER JOIN
        property p ON s.PropertyId = p.Id
    ORDER BY
        p.Price DESC
    LIMIT 5
) AS TopProperties;


--/* Medium query 3 */:
-- Display the cities with the highest number of flats available for rent
-- This is a medium query as it uses an INNER JOIN and GROUP BY operations to select the relevant data from the forRent table and display it to the user.
SELECT
    p.City,
    COUNT(DISTINCT CASE WHEN p.Type = 'flat' THEN p.Id END) AS NumFlats
FROM
    property p
INNER JOIN
    forRent fr ON p.Id = fr.PropertyId
GROUP BY
    p.City
ORDER BY
    NumFlats DESC
LIMIT 5;


--/* Advanced query 1 */:
-- Show all customers who have a house that costs more than the average price of a house
-- This is an advanced query as it incorporates nested queries (subquery within the WHERE clause) and an aggregation function (AVG) to filter and retrieve specific customer and property data based on the query.
SELECT
    c.Id AS CustomerId,
    c.FirstName,
    c.LastName,
    c.PhoneNumber,
    p.City,
    p.Price AS HousePrice
FROM
    customer c
    INNER JOIN sold s ON c.Id = s.CustomerId
    INNER JOIN property p ON s.PropertyId = p.Id
WHERE
    p.Type = 'house'
    AND p.Price > (
        SELECT AVG(Price)
        FROM property
        WHERE Type = 'house'
    )
ORDER BY
    CustomerId ASC;


--/* Advanced query 2 */: 
-- Find customers who have bought properties above the average price
-- This is an advanced query as it uses nested queries (subquery within the WHERE clause) to retrieve the average price from the property table so it can be used as a comparison to fulfil the WHERE clause.
SELECT 
    c.Id AS CustomerId, 
    c.FirstName, 
    c.LastName, 
    p.Id AS PropertyId, 
    p.Price AS PurchasedPrice
FROM 
    customer c
INNER JOIN 
    sold s ON c.Id = s.CustomerId
INNER JOIN 
    property p ON s.PropertyId = p.Id
WHERE 
    p.Price > (SELECT AVG(Price) FROM property);


--/* Advanced query 3 */:
-- Find the average property price per bedroom for each postcode area
-- This is an advanced query as it uses a subquery to calculate the average property price and a JOIN operation to derive the average price per bedroom for each postcode area.
SELECT 
    pc.Area AS PostcodeArea, 
    ROUND(AVG(p.Price / p.NumBedrooms), 2) AS AvgPricePerBedroom
FROM 
    property p
INNER JOIN 
    Postcode pc ON p.PostcodeId = pc.Id
WHERE 
    p.Price > (
        SELECT AVG(Price) FROM property
    )
GROUP BY 
    pc.Area;





