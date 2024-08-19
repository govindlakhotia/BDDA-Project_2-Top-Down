create database retail_store;

use retail_store;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    Description TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(50),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    DepartmentID INT,
    SupplierID INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    HireDate DATE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityAvailable INT,
    ReorderLevel INT,
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Promotions (
    PromotionID INT PRIMARY KEY,
    PromotionName VARCHAR(100),
    Discount DECIMAL(5, 2),
    StartDate DATE,
    EndDate DATE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE OrderPromotions (
    OrderPromotionID INT PRIMARY KEY,
    OrderID INT,
    PromotionID INT,
    DiscountAmount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (PromotionID) REFERENCES Promotions(PromotionID)
);

CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY,
    ShipperName VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Departments VALUES 
(1, 'Electronics', 'All kinds of electronic gadgets and accessories', '2024-08-17 10:00:00'),
(2, 'Groceries', 'Daily essential groceries and food items', '2024-08-17 10:00:00'),
(3, 'Clothing', 'Apparel for men, women, and children', '2024-08-17 10:00:00'),
(4, 'Home Appliances', 'Home and kitchen appliances', '2024-08-17 10:00:00'),
(5, 'Furniture', 'Furniture for home and office', '2024-08-17 10:00:00'),
(6, 'Books', 'Books of various genres', '2024-08-17 10:00:00'),
(7, 'Sports', 'Sports equipment and accessories', '2024-08-17 10:00:00'),
(8, 'Footwear', 'Footwear for all ages', '2024-08-17 10:00:00'),
(9, 'Beauty & Personal Care', 'Cosmetics and personal care products', '2024-08-17 10:00:00'),
(10, 'Toys', 'Toys and games for children', '2024-08-17 10:00:00');

INSERT INTO Suppliers VALUES 
(1, 'Reliance Industries', 'Mukesh Ambani', '9876543210', 'reliance@ril.com', 'Bandra Kurla Complex', 'Mumbai', 'Maharashtra', '400051', '2024-08-17 10:00:00'),
(2, 'ITC Limited', 'Sanjiv Puri', '9988776655', 'itc@itc.in', '37, J.L. Nehru Road', 'Kolkata', 'West Bengal', '700071', '2024-08-17 10:00:00'),
(3, 'Tata Group', 'Natarajan Chandrasekaran', '9123456789', 'tata@tatagroup.com', 'Bombay House', 'Mumbai', 'Maharashtra', '400001', '2024-08-17 10:00:00'),
(4, 'Godrej Group', 'Pirojsha Godrej', '9823456789', 'godrej@godrej.com', 'Pirojshanagar', 'Mumbai', 'Maharashtra', '400079', '2024-08-17 10:00:00'),
(5, 'Hindustan Unilever', 'Sanjiv Mehta', '9765432109', 'hul@unilever.com', 'Backbay Reclamation', 'Mumbai', 'Maharashtra', '400020', '2024-08-17 10:00:00'),
(6, 'Samsung India', 'Hyun Kim', '9812345678', 'samsung@in.samsung.com', 'DLF Centre', 'New Delhi', 'Delhi', '110001', '2024-08-17 10:00:00'),
(7, 'LG India', 'Ki Wan Kim', '9871234560', 'lg@lge.com', 'Surya Towers', 'New Delhi', 'Delhi', '110019', '2024-08-17 10:00:00'),
(8, 'Sony India', 'Sunil Nayyar', '9823654789', 'sony@sony.co.in', 'ABW Towers', 'Gurgaon', 'Haryana', '122002', '2024-08-17 10:00:00'),
(9, 'Marico', 'Saugata Gupta', '9867543210', 'marico@marico.com', 'Kalpataru Inspire', 'Mumbai', 'Maharashtra', '400013', '2024-08-17 10:00:00'),
(10, 'Amazon India', 'Amit Agarwal', '9998877665', 'amazon@amazon.in', 'World Trade Center', 'Bangalore', 'Karnataka', '560055', '2024-08-17 10:00:00');

INSERT INTO Products VALUES 
(1, 'Samsung Galaxy S21', 'Latest Samsung smartphone', 69999.00, 1, 6, '2024-08-17 10:00:00'),
(2, 'Tata Salt', 'Iodized salt', 20.00, 2, 3, '2024-08-17 10:00:00'),
(3, 'Levi\'s Jeans', 'Comfortable denim jeans', 2499.00, 3, 1, '2024-08-17 10:00:00'),
(4, 'Godrej Refrigerator', 'Double-door refrigerator', 29999.00, 4, 4, '2024-08-17 10:00:00'),
(5, 'Wooden Dining Table', '6-seater dining table', 15999.00, 5, 3, '2024-08-17 10:00:00'),
(6, 'Harry Potter Book Set', 'Complete set of 7 books', 3500.00, 6, 10, '2024-08-17 10:00:00'),
(7, 'Cricket Bat', 'English willow cricket bat', 4999.00, 7, 5, '2024-08-17 10:00:00'),
(8, 'Nike Running Shoes', 'Lightweight running shoes', 6999.00, 8, 1, '2024-08-17 10:00:00'),
(9, 'Lakme Face Cream', 'Moisturizing cream', 399.00, 9, 5, '2024-08-17 10:00:00'),
(10, 'Lego Building Blocks', 'Creative toy set', 2499.00, 10, 9, '2024-08-17 10:00:00');

INSERT INTO Customers VALUES 
(1, 'Amit', 'Sharma', 'amit.sharma@gmail.com', '9811122233', '123, Green Park', 'New Delhi', 'Delhi', '110016', '2024-08-17 10:00:00'),
(2, 'Priya', 'Verma', 'priya.verma@yahoo.com', '9822334455', '456, Sector 21', 'Gurgaon', 'Haryana', '122001', '2024-08-17 10:00:00'),
(3, 'Rahul', 'Kumar', 'rahul.kumar@outlook.com', '9911345566', '789, MG Road', 'Bangalore', 'Karnataka', '560001', '2024-08-17 10:00:00'),
(4, 'Sneha', 'Mehta', 'sneha.mehta@rediffmail.com', '9877654321', '321, Banjara Hills', 'Hyderabad', 'Telangana', '500034', '2024-08-17 10:00:00'),
(5, 'Vikram', 'Singh', 'vikram.singh@gmail.com', '9923445566', '654, Salt Lake', 'Kolkata', 'West Bengal', '700064', '2024-08-17 10:00:00'),
(6, 'Riya', 'Kapoor', 'riya.kapoor@yahoo.com', '9898765432', '987, Koramangala', 'Bangalore', 'Karnataka', '560034', '2024-08-17 10:00:00'),
(7, 'Arjun', 'Chauhan', 'arjun.chauhan@gmail.com', '9876543210', '741, Connaught Place', 'New Delhi', 'Delhi', '110001', '2024-08-17 10:00:00'),
(8, 'Neha', 'Patel', 'neha.patel@gmail.com', '9933221100', '852, Juhu', 'Mumbai', 'Maharashtra', '400049', '2024-08-17 10:00:00'),
(9, 'Rohit', 'Gupta', 'rohit.gupta@yahoo.com', '9888776655', '963, Vashi', 'Navi Mumbai', 'Maharashtra', '400703', '2024-08-17 10:00:00'),
(10, 'Kavya', 'Iyer', 'kavya.iyer@outlook.com', '9865432109', '258, Velachery', 'Chennai', 'Tamil Nadu', '600042', '2024-08-17 10:00:00');

INSERT INTO Employees VALUES 
(1, 'Rakesh', 'Yadav', 'Store Manager', 600000.00, '9819988777', 'rakesh.yadav@store.com', '2023-01-01', 1),
(2, 'Manisha', 'Bose', 'Cashier', 250000.00, '9822331122', 'manisha.bose@store.com', '2023-02-15', 2),
(3, 'Suresh', 'Patel', 'Sales Associate', 300000.00, '9933445566', 'suresh.patel@store.com', '2023-03-10', 3),
(4, 'Anjali', 'Nair', 'Inventory Manager', 450000.00, '9944556677', 'anjali.nair@store.com', '2023-04-20', 4),
(5, 'Rajesh', 'Jain', 'Department Head', 500000.00, '9955667788', 'rajesh.jain@store.com', '2023-05-05', 5),
(6, 'Pooja', 'Malik', 'Customer Service', 280000.00, '9966778899', 'pooja.malik@store.com', '2023-06-15', 6),
(7, 'Vivek', 'Agarwal', 'Floor Supervisor', 400000.00, '9977889900', 'vivek.agarwal@store.com', '2023-07-01', 7),
(8, 'Reena', 'Sharma', 'Merchandiser', 320000.00, '9988990011', 'reena.sharma@store.com', '2023-08-10', 8),
(9, 'Karan', 'Khurana', 'Marketing Manager', 550000.00, '9999001122', 'karan.khurana@store.com', '2023-09-25', 9),
(10, 'Divya', 'Rao', 'HR Manager', 600000.00, '9900112233', 'divya.rao@store.com', '2023-10-05', 10);

INSERT INTO Orders VALUES 
(1, 1, 2, '2024-08-01 12:30:00', 70599.00, 'Completed'),
(2, 3, 3, '2024-08-02 14:00:00', 2520.00, 'Completed'),
(3, 5, 4, '2024-08-03 16:45:00', 30299.00, 'Pending'),
(4, 7, 5, '2024-08-04 18:15:00', 16499.00, 'Completed'),
(5, 9, 1, '2024-08-05 19:00:00', 7500.00, 'Completed'),
(6, 2, 6, '2024-08-06 10:30:00', 389.00, 'Completed'),
(7, 4, 7, '2024-08-07 11:45:00', 5100.00, 'Pending'),
(8, 6, 8, '2024-08-08 12:00:00', 7399.00, 'Completed'),
(9, 8, 9, '2024-08-09 15:30:00', 2799.00, 'Completed'),
(10, 10, 10, '2024-08-10 17:00:00', 25249.00, 'Pending');

INSERT INTO OrderDetails VALUES 
(1, 1, 1, 1, 69999.00),
(2, 2, 2, 2, 40.00),
(3, 2, 3, 1, 2499.00),
(4, 3, 4, 1, 29999.00),
(5, 4, 5, 1, 15999.00),
(6, 5, 6, 1, 3500.00),
(7, 6, 9, 1, 399.00),
(8, 7, 7, 1, 4999.00),
(9, 8, 8, 1, 6999.00),
(10, 9, 10, 1, 2499.00);

INSERT INTO Inventory VALUES 
(1, 1, 50, 10, '2024-08-01 10:00:00'),
(2, 2, 200, 50, '2024-08-01 10:00:00'),
(3, 3, 150, 30, '2024-08-01 10:00:00'),
(4, 4, 30, 5, '2024-08-01 10:00:00'),
(5, 5, 20, 5, '2024-08-01 10:00:00'),
(6, 6, 100, 20, '2024-08-01 10:00:00'),
(7, 7, 60, 10, '2024-08-01 10:00:00'),
(8, 8, 80, 15, '2024-08-01 10:00:00'),
(9, 9, 120, 30, '2024-08-01 10:00:00'),
(10, 10, 90, 20, '2024-08-01 10:00:00');

INSERT INTO Payments VALUES 
(1, 1, '2024-08-01 12:45:00', 70599.00, 'Credit Card'),
(2, 2, '2024-08-02 14:15:00', 2520.00, 'Debit Card'),
(3, 4, '2024-08-04 18:30:00', 16499.00, 'UPI'),
(4, 5, '2024-08-05 19:15:00', 7500.00, 'Net Banking'),
(5, 6, '2024-08-06 10:45:00', 389.00, 'Cash'),
(6, 8, '2024-08-08 12:15:00', 7399.00, 'Credit Card'),
(7, 9, '2024-08-09 15:45:00', 2799.00, 'UPI'),
(8, 10, '2024-08-10 17:15:00', 25249.00, 'Debit Card');

INSERT INTO Promotions VALUES 
(1, 'Independence Day Sale', 10.00, '2024-08-10', '2024-08-15', '2024-08-01 10:00:00'),
(2, 'Diwali Festive Offer', 20.00, '2024-10-20', '2024-11-05', '2024-08-01 10:00:00'),
(3, 'New Year Sale', 15.00, '2024-12-25', '2025-01-05', '2024-08-01 10:00:00'),
(4, 'Summer Clearance Sale', 25.00, '2024-05-01', '2024-05-15', '2024-08-01 10:00:00'),
(5, 'Republic Day Offer', 10.00, '2024-01-20', '2024-01-26', '2024-08-01 10:00:00'),
(6, 'Back to School', 5.00, '2024-06-01', '2024-06-15', '2024-08-01 10:00:00'),
(7, 'Monsoon Special', 12.00, '2024-07-01', '2024-07-15', '2024-08-01 10:00:00'),
(8, 'Christmas Bonanza', 18.00, '2024-12-20', '2024-12-25', '2024-08-01 10:00:00'),
(9, 'Ganesh Chaturthi Offer', 8.00, '2024-09-10', '2024-09-20', '2024-08-01 10:00:00'),
(10, 'Pongal Harvest Sale', 7.00, '2024-01-10', '2024-01-15', '2024-08-01 10:00:00');

INSERT INTO OrderPromotions VALUES 
(1, 1, 1, 7059.90),
(2, 2, 2, 504.00),
(3, 4, 3, 2474.85),
(4, 5, 4, 1875.00),
(5, 6, 5, 38.90),
(6, 8, 6, 369.95),
(7, 9, 7, 335.88),
(8, 10, 8, 4544.82);

INSERT INTO Shippers VALUES 
(1, 'Blue Dart', '9845098450', 'contact@bluedart.com', 'Marathahalli', 'Bangalore', 'Karnataka', '560037', '2024-08-01 10:00:00'),
(2, 'DTDC', '9835098350', 'support@dtdc.com', 'Andheri', 'Mumbai', 'Maharashtra', '400059', '2024-08-01 10:00:00'),
(3, 'Delhivery', '9825098250', 'info@delhivery.com', 'Dwarka', 'New Delhi', 'Delhi', '110075', '2024-08-01 10:00:00'),
(4, 'Ecom Express', '9815098150', 'help@ecomexpress.in', 'Banjara Hills', 'Hyderabad', 'Telangana', '500034', '2024-08-01 10:00:00'),
(5, 'Gati', '9805098050', 'service@gati.com', 'Salt Lake', 'Kolkata', 'West Bengal', '700064', '2024-08-01 10:00:00'),
(6, 'Xpressbees', '9795097950', 'contact@xpressbees.com', 'Velachery', 'Chennai', 'Tamil Nadu', '600042', '2024-08-01 10:00:00'),
(7, 'India Post', '9785097850', 'care@indiapost.gov.in', 'Connaught Place', 'New Delhi', 'Delhi', '110001', '2024-08-01 10:00:00'),
(8, 'Shadowfax', '9775097750', 'support@shadowfax.in', 'Koramangala', 'Bangalore', 'Karnataka', '560034', '2024-08-01 10:00:00'),
(9, 'FedEx', '9765097650', 'contact@fedex.com', 'Vashi', 'Navi Mumbai', 'Maharashtra', '400703', '2024-08-01 10:00:00'),
(10, 'Aramex', '9755097550', 'help@aramex.com', 'Juhu', 'Mumbai', 'Maharashtra', '400049', '2024-08-01 10:00:00');

SELECT * FROM Departments;
SELECT * FROM Suppliers;
SELECT * FROM Products;
SELECT * FROM Customers;
SELECT * FROM Employees;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Inventory;
SELECT * FROM Payments;
SELECT * FROM Promotions;
SELECT * FROM OrderPromotions;
SELECT * FROM Shippers;

CREATE ROLE 'AdminRole';
CREATE ROLE 'ManagerRole';
CREATE ROLE 'SalesRole';
CREATE ROLE 'InventoryRole';
CREATE ROLE 'CustomerServiceRole';

GRANT ALL PRIVILEGES ON retail_store.* TO 'AdminRole';

GRANT SELECT, INSERT, UPDATE, DELETE ON retail_store.Orders TO 'ManagerRole';
GRANT SELECT, INSERT, UPDATE ON retail_store.Products TO 'ManagerRole';
GRANT SELECT, INSERT, UPDATE ON retail_store.Employees TO 'ManagerRole';
GRANT SELECT ON retail_store.Customers TO 'ManagerRole';

GRANT SELECT, INSERT, UPDATE ON retail_store.Orders TO 'SalesRole';
GRANT SELECT ON retail_store.Products TO 'SalesRole';
GRANT SELECT, INSERT, UPDATE ON retail_store.Customers TO 'SalesRole';

GRANT SELECT, INSERT, UPDATE ON retail_store.Inventory TO 'InventoryRole';
GRANT SELECT, INSERT, UPDATE ON retail_store.Products TO 'InventoryRole';

GRANT SELECT ON retail_store.Orders TO 'CustomerServiceRole';
GRANT SELECT ON retail_store.Customers TO 'CustomerServiceRole';

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'manager_user'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'sales_user'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'inventory_user'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'customer_service_user'@'localhost' IDENTIFIED BY 'password123';

GRANT 'AdminRole' TO 'admin_user'@'localhost';
GRANT 'ManagerRole' TO 'manager_user'@'localhost';
GRANT 'SalesRole' TO 'sales_user'@'localhost';
GRANT 'InventoryRole' TO 'inventory_user'@'localhost';
GRANT 'CustomerServiceRole' TO 'customer_service_user'@'localhost';

FLUSH PRIVILEGES;
