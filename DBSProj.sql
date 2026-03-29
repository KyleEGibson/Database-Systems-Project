DROP TABLE IF EXISTS OrderDetails, Orders, Products, Categories, Suppliers, Customers, Employees;

-- 1. Employees
CREATE TABLE Employees AS
SELECT DISTINCT
    employeeID,
    employeeslastName AS lastName,
    employeesfirstName AS firstName,
    employeestitle AS title
FROM companydata_clean;

ALTER TABLE Employees
ADD PRIMARY KEY (employeeID);


-- 2. Customers
CREATE TABLE Customers (
    customerID VARCHAR(10) PRIMARY KEY,
    companyName VARCHAR(100),
    contactName VARCHAR(100),
    contactTitle VARCHAR(100)
);

INSERT INTO Customers
SELECT DISTINCT
    customerID,
    companyName,
    contactName,
    contactTitle
FROM companydata_clean;


-- 3. Suppliers
CREATE TABLE Suppliers AS
SELECT DISTINCT
    supplierID,
    supplierscompanyName AS companyName,
    supplierscontactName AS contactName,
    supplierscontactTitle AS contactTitle
FROM companydata_clean;

ALTER TABLE Suppliers
ADD PRIMARY KEY (supplierID);


-- 4. Categories
CREATE TABLE Categories AS
SELECT DISTINCT
    categoryID,
    categoryName
FROM companydata_clean;

ALTER TABLE Categories
ADD PRIMARY KEY (categoryID);


-- 5. Products
CREATE TABLE Products AS
SELECT DISTINCT
    productID,
    productName,
    supplierID,
    categoryID,
    quantityPerUnit,
    unitPrice1 AS unitPrice,
    unitsInStock,
    unitsOnOrder,
    reorderLevel,
    discontinued
FROM companydata_clean;

ALTER TABLE Products
ADD PRIMARY KEY (productID),
ADD FOREIGN KEY (supplierID) REFERENCES Suppliers(supplierID),
ADD FOREIGN KEY (categoryID) REFERENCES Categories(categoryID);


-- 6. Orders
CREATE TABLE Orders (
    orderID INT PRIMARY KEY,
    customerID VARCHAR(10),
    employeeID INT,
    orderDate DATE,
    requiredDate DATE,
    shippedDate DATE,
    shipVia INT,
    freight DECIMAL(10,2),
    FOREIGN KEY (customerID) REFERENCES Customers(customerID),
    FOREIGN KEY (employeeID) REFERENCES Employees(employeeID)
);

INSERT INTO Orders
SELECT DISTINCT
    orderID,
    customerID,
    employeeID,
    orderDate,
    requiredDate,
    shippedDate,
    shipVia,
    Freight
FROM companydata_clean;


-- 7. OrderDetails
CREATE TABLE OrderDetails AS
SELECT
    orderID,
    productID,
    unitPrice,
    quantity,
    discount
FROM companydata_clean;

ALTER TABLE OrderDetails
ADD PRIMARY KEY (orderID, productID),
ADD FOREIGN KEY (orderID) REFERENCES Orders(orderID),
ADD FOREIGN KEY (productID) REFERENCES Products(productID);

