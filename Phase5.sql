-- View: quantity sold and revenue per employee
CREATE OR REPLACE VIEW EmployeeSales AS
SELECT
    e.employeeID,
    e.firstName,
    e.lastName,
    SUM(od.quantity) AS totalQuantitySold,
    SUM(od.quantity * od.unitPrice * (1 - (od.discount / 100))) AS totalRevenue
FROM Employees e
JOIN Orders o ON e.employeeID = o.employeeID
JOIN OrderDetails od ON o.orderID = od.orderID
GROUP BY e.employeeID, e.firstName, e.lastName;


-- Reduce stock when order placed
DROP TRIGGER IF EXISTS ReduceStockAfterOrder;

DELIMITER $$
CREATE TRIGGER ReduceStockAfterOrder
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Products
    SET unitsInStock = unitsInStock - NEW.quantity
    WHERE productID = NEW.productID;
END$$
DELIMITER ;


-- Check for products low in stock
DROP PROCEDURE IF EXISTS CheckReorderProducts;

DELIMITER $$
CREATE PROCEDURE CheckReorderProducts()
BEGIN
    SELECT
        productID,
        productName,
        unitsInStock,
        reorderLevel
    FROM Products
    WHERE unitsInStock <= reorderLevel;
END$$
DELIMITER ;

-- Display view and call
SELECT * FROM EmployeeSales;
CALL CheckReorderProducts();