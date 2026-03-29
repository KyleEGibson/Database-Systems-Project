DROP TABLE IF EXISTS OrderDetails, Orders, Products, Categories, Suppliers, Customers, Employees;

-- 1. Employees
CREATE TABLE Employees (
    employeeID INT PRIMARY KEY,
    lastName VARCHAR(50),
    firstName VARCHAR(50),
    title VARCHAR(100)
);

INSERT INTO Employees
SELECT DISTINCT
    employeeID,
    employeeslastName,
    employeesfirstName,
    employeestitle
FROM companydata_clean;

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
CREATE TABLE Suppliers (
    supplierID INT PRIMARY KEY,
    companyName VARCHAR(100),
    contactName VARCHAR(100),
    contactTitle VARCHAR(100)
);

INSERT INTO Suppliers
SELECT DISTINCT
    supplierID,
    supplierscompanyName,
    supplierscontactName,
    supplierscontactTitle
FROM companydata_clean;

-- 4. Categories
CREATE TABLE Categories (
    categoryID INT PRIMARY KEY,
    categoryName VARCHAR(100)
);

INSERT INTO Categories
SELECT DISTINCT
    categoryID,
    categoryName
FROM companydata_clean;

-- 5. Products
CREATE TABLE Products (
    productID INT PRIMARY KEY,
    productName VARCHAR(100),
    supplierID INT,
    categoryID INT,
    quantityPerUnit VARCHAR(50),
    unitPrice DECIMAL(10,2),
    unitsInStock INT,
    unitsOnOrder INT,
    reorderLevel INT,
    discontinued BOOLEAN,
    FOREIGN KEY (supplierID) REFERENCES Suppliers(supplierID),
    FOREIGN KEY (categoryID) REFERENCES Categories(categoryID)
);

INSERT INTO Products
SELECT DISTINCT
    productID,
    productName,
    supplierID,
    categoryID,
    quantityPerUnit,
    unitPrice1,
    unitsInStock,
    unitsOnOrder,
    reorderLevel,
    discontinued
FROM companydata_clean;

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
CREATE TABLE OrderDetails (
    orderID INT,
    productID INT,
    unitPrice DECIMAL(10,2),
    quantity INT DEFAULT 1 CHECK (quantity >= 0),
    discount DECIMAL(4,2),
    PRIMARY KEY (orderID, productID),
    FOREIGN KEY (orderID) REFERENCES Orders(orderID),
    FOREIGN KEY (productID) REFERENCES Products(productID)
);

INSERT INTO OrderDetails
SELECT
    orderID,
    productID,
    unitPrice,
    quantity,
    discount
FROM companydata_clean;
