create database retail_store;

use retail_store;

CREATE TABLE Departments (
    DepartmentID CHAR(10) PRIMARY KEY,
    DepartmentName VARCHAR(100),
    Description TEXT,
);

CREATE TABLE Suppliers (
    SupplierID CHAR(10) PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(50),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
);

CREATE TABLE Products (
    ProductID CHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    DepartmentID CHAR(10),
    SupplierID CHAR(10),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Customers (
    CustomerID CHAR(10) PRIMARY KEY,
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
    EmployeeID CHAR(10) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    HireDate DATE,
    DepartmentID CHAR(10),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Orders (
    OrderID CHAR(10) PRIMARY KEY,
    CustomerID CHAR(10),
    EmployeeID CHAR(10),
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE OrderDetails (
    OrderDetailID CHAR(10) PRIMARY KEY,
    OrderID CHAR(10),
    ProductID CHAR(10),
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Inventory (
    InventoryID CHAR(10) PRIMARY KEY,
    ProductID CHAR(10),
    QuantityAvailable INT,
    ReorderLevel INT,
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID CHAR(10) PRIMARY KEY,
    OrderID CHAR(10),
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Promotions (
    PromotionID CHAR(10) PRIMARY KEY,
    PromotionName VARCHAR(100),
    Discount DECIMAL(5, 2),
    StartDate DATE,
    EndDate DATE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE OrderPromotions (
    OrderPromotionID CHAR(10) PRIMARY KEY,
    OrderID CHAR(10),
    PromotionID CHAR(10),
    DiscountAmount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (PromotionID) REFERENCES Promotions(PromotionID)
);

CREATE TABLE Shippers (
    ShipperID CHAR(10) PRIMARY KEY,
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
('DEPT001', 'Electronics', 'All kinds of electronic gadgets and accessories'),
('DEPT002', 'Groceries', 'Daily essential groceries and food items'),
('DEPT003', 'Clothing', 'Apparel for men, women, and children'),
('DEPT004', 'Home Appliances', 'Home and kitchen appliances'),
('DEPT005', 'Furniture', 'Furniture for home and office'),
('DEPT006', 'Books', 'Books of various genres'),
('DEPT007', 'Sports', 'Sports equipment and accessories'),
('DEPT008', 'Footwear', 'Footwear for all ages'),
('DEPT009', 'Beauty & Personal Care', 'Cosmetics and personal care products'),
('DEPT010', 'Toys', 'Toys and games for children');

INSERT INTO Suppliers VALUES 
('SUP001', 'Reliance Industries', 'Mukesh Ambani', '9876543210', 'reliance@ril.com', 'Bandra Kurla Complex', 'Mumbai', 'Maharashtra', '400051'),
('SUP002', 'ITC Limited', 'Sanjiv Puri', '9988776655', 'itc@itc.in', '37, J.L. Nehru Road', 'Kolkata', 'West Bengal', '700071'),
('SUP003', 'Tata Group', 'Natarajan Chandrasekaran', '9123456789', 'tata@tatagroup.com', 'Bombay House', 'Mumbai', 'Maharashtra', '400001'),
('SUP004', 'Godrej Group', 'Pirojsha Godrej', '9823456789', 'godrej@godrej.com', 'Pirojshanagar', 'Mumbai', 'Maharashtra', '400079'),
('SUP005', 'Hindustan Unilever', 'Sanjiv Mehta', '9765432109', 'hul@unilever.com', 'Backbay Reclamation', 'Mumbai', 'Maharashtra', '400020'),
('SUP006', 'Samsung India', 'Hyun Kim', '9812345678', 'samsung@in.samsung.com', 'DLF Centre', 'New Delhi', 'Delhi', '110001'),
('SUP007', 'LG India', 'Ki Wan Kim', '9871234560', 'lg@lge.com', 'Surya Towers', 'New Delhi', 'Delhi', '110019'),
('SUP008', 'Sony India', 'Sunil Nayyar', '9823654789', 'sony@sony.co.in', 'ABW Towers', 'Gurgaon', 'Haryana', '122002'),
('SUP009', 'Marico', 'Saugata Gupta', '9867543210', 'marico@marico.com', 'Kalpataru Inspire', 'Mumbai', 'Maharashtra', '400013'),
('SUP010', 'Amazon India', 'Amit Agarwal', '9998877665', 'amazon@amazon.in', 'World Trade Center', 'Bangalore', 'Karnataka', '560055');

INSERT INTO Products VALUES 
('PROD001', 'Samsung Galaxy S21', 'Latest Samsung smartphone', 69999.00, 'DEPT001', 'SUP006', '2024-08-17 10:00:00'),
('PROD002', 'Tata Salt', 'Iodized salt', 20.00, 'DEPT002', 'SUP003', '2024-08-17 10:00:00'),
('PROD003', 'Levi\'s Jeans', 'Comfortable denim jeans', 2499.00, 'DEPT003', 'SUP001', '2024-08-17 10:00:00'),
('PROD004', 'Godrej Refrigerator', 'Double-door refrigerator', 29999.00, 'DEPT004', 'SUP004', '2024-08-17 10:00:00'),
('PROD005', 'Wooden Dining Table', '6-seater dining table', 15999.00, 'DEPT005', 'SUP003', '2024-08-17 10:00:00'),
('PROD006', 'Harry Potter Book Set', 'Complete set of 7 books', 3500.00, 'DEPT006', 'SUP010', '2024-08-17 10:00:00'),
('PROD007', 'Cricket Bat', 'English willow cricket bat', 4999.00, 'DEPT007', 'SUP005', '2024-08-17 10:00:00'),
('PROD008', 'Nike Running Shoes', 'Lightweight running shoes', 6999.00, 'DEPT008', 'SUP001', '2024-08-17 10:00:00'),
('PROD009', 'Lakme Face Cream', 'Moisturizing cream', 399.00, 'DEPT009', 'SUP005', '2024-08-17 10:00:00'),
('PROD010', 'Lego Building Blocks', 'Creative toy set', 2499.00, 'DEPT010', 'SUP009', '2024-08-17 10:00:00');

INSERT INTO Customers VALUES 
('CUST001', 'Amit', 'Sharma', 'amit.sharma@gmail.com', '9811122233', '123, Green Park', 'New Delhi', 'Delhi', '110016', '2024-08-17 10:00:00'),
('CUST002', 'Priya', 'Verma', 'priya.verma@yahoo.com', '9822334455', '456, Sector 21', 'Gurgaon', 'Haryana', '122001', '2024-08-17 10:00:00'),
('CUST003', 'Rahul', 'Kumar', 'rahul.kumar@outlook.com', '9911345566', '789, MG Road', 'Bangalore', 'Karnataka', '560001', '2024-08-17 10:00:00'),
('CUST004', 'Sneha', 'Mehta', 'sneha.mehta@rediffmail.com', '9877654321', '321, Banjara Hills', 'Hyderabad', 'Telangana', '500034', '2024-08-17 10:00:00'),
('CUST005', 'Vikram', 'Singh', 'vikram.singh@gmail.com', '9923445566', '654, Salt Lake', 'Kolkata', 'West Bengal', '700064', '2024-08-17 10:00:00'),
('CUST006', 'Riya', 'Kapoor', 'riya.kapoor@yahoo.com', '9898765432', '987, Koramangala', 'Bangalore', 'Karnataka', '560034', '2024-08-17 10:00:00'),
('CUST007', 'Arjun', 'Chauhan', 'arjun.chauhan@gmail.com', '9876543210', '741, Connaught Place', 'New Delhi', 'Delhi', '110001', '2024-08-17 10:00:00'),
('CUST008', 'Neha', 'Patel', 'neha.patel@gmail.com', '9933221100', '852, Juhu', 'Mumbai', 'Maharashtra', '400049', '2024-08-17 10:00:00'),
('CUST009', 'Rohit', 'Gupta', 'rohit.gupta@yahoo.com', '9888776655', '963, Vashi', 'Navi Mumbai', 'Maharashtra', '400703', '2024-08-17 10:00:00'),
('CUST010', 'Kavya', 'Iyer', 'kavya.iyer@outlook.com', '9865432109', '258, Velachery', 'Chennai', 'Tamil Nadu', '600042', '2024-08-17 10:00:00');

INSERT INTO Employees VALUES 
('EMP001', 'Rakesh', 'Yadav', 'Store Manager', 600000.00, '9819988777', 'rakesh.yadav@store.com', '2023-01-01', 'DEPT001'),
('EMP002', 'Manisha', 'Bose', 'Cashier', 250000.00, '9822331122', 'manisha.bose@store.com', '2023-02-15', 'DEPT002'),
('EMP003', 'Suresh', 'Patel', 'Sales Associate', 300000.00, '9933445566', 'suresh.patel@store.com', '2023-03-10', 'DEPT003'),
('EMP004', 'Anjali', 'Nair', 'Inventory Manager', 450000.00, '9944556677', 'anjali.nair@store.com', '2023-04-20', 'DEPT004'),
('EMP005', 'Rajesh', 'Jain', 'Department Head', 500000.00, '9955667788', 'rajesh.jain@store.com', '2023-05-05', 'DEPT005'),
('EMP006', 'Pooja', 'Malik', 'Customer Service', 280000.00, '9966778899', 'pooja.malik@store.com', '2023-06-15', 'DEPT006'),
('EMP007', 'Vivek', 'Agarwal', 'Floor Supervisor', 400000.00, '9977889900', 'vivek.agarwal@store.com', '2023-07-01', 'DEPT007'),
('EMP008', 'Reena', 'Sharma', 'Merchandiser', 320000.00, '9988990011', 'reena.sharma@store.com', '2023-08-10', 'DEPT008'),
('EMP009', 'Karan', 'Khurana', 'Marketing Manager', 550000.00, '9999001122', 'karan.khurana@store.com', '2023-09-25', 'DEPT009'),
('EMP010', 'Divya', 'Rao', 'HR Manager', 600000.00, '9900112233', 'divya.rao@store.com', '2023-10-05', 'DEPT010');

INSERT INTO Orders VALUES 
('ORD001', 'CUST001', 'EMP002', '2024-08-01 12:30:00', 70599.00, 'Completed'),
('ORD002', 'CUST003', 'EMP003', '2024-08-02 14:00:00', 2520.00, 'Completed'),
('ORD003', 'CUST005', 'EMP004', '2024-08-03 16:45:00', 30299.00, 'Pending'),
('ORD004', 'CUST007', 'EMP005', '2024-08-04 18:15:00', 16499.00, 'Completed'),
('ORD005', 'CUST009', 'EMP001', '2024-08-05 19:00:00', 7500.00, 'Completed'),
('ORD006', 'CUST002', 'EMP006', '2024-08-06 10:30:00', 389.00, 'Completed'),
('ORD007', 'CUST004', 'EMP007', '2024-08-07 11:45:00', 5100.00, 'Pending'),
('ORD008', 'CUST006', 'EMP008', '2024-08-08 12:00:00', 7399.00, 'Completed'),
('ORD009', 'CUST008', 'EMP009', '2024-08-09 15:30:00', 2799.00, 'Completed'),
('ORD010', 'CUST010', 'EMP010', '2024-08-10 17:00:00', 25249.00, 'Pending');

INSERT INTO OrderDetails VALUES 
('OD001', 'ORD001', 'PROD001', 1, 69999.00),
('OD002', 'ORD002', 'PROD002', 2, 40.00),
('OD003', 'ORD002', 'PROD003', 1, 2499.00),
('OD004', 'ORD003', 'PROD004', 1, 29999.00),
('OD005', 'ORD004', 'PROD005', 1, 15999.00),
('OD006', 'ORD005', 'PROD006', 1, 3500.00),
('OD007', 'ORD006', 'PROD009', 1, 399.00),
('OD008', 'ORD007', 'PROD007', 1, 4999.00),
('OD009', 'ORD008', 'PROD008', 1, 6999.00),
('OD010', 'ORD009', 'PROD010', 1, 2499.00);

INSERT INTO Inventory VALUES 
('INV001', 'PROD001', 50, 10, '2024-08-01 10:00:00'),
('INV002', 'PROD002', 200, 50, '2024-08-01 10:00:00'),
('INV003', 'PROD003', 150, 30, '2024-08-01 10:00:00'),
('INV004', 'PROD004', 30, 5, '2024-08-01 10:00:00'),
('INV005', 'PROD005', 20, 5, '2024-08-01 10:00:00'),
('INV006', 'PROD006', 100, 20, '2024-08-01 10:00:00'),
('INV007', 'PROD007', 60, 10, '2024-08-01 10:00:00'),
('INV008', 'PROD008', 80, 15, '2024-08-01 10:00:00'),
('INV009', 'PROD009', 120, 30, '2024-08-01 10:00:00'),
('INV010', 'PROD010', 90, 20, '2024-08-01 10:00:00');

INSERT INTO Payments VALUES 
('PAY001', 'ORD001', '2024-08-01 12:45:00', 70599.00, 'Credit Card'),
('PAY002', 'ORD002', '2024-08-02 14:15:00', 2520.00, 'Debit Card'),
('PAY003', 'ORD004', '2024-08-04 18:30:00', 16499.00, 'UPI'),
('PAY004', 'ORD005', '2024-08-05 19:15:00', 7500.00, 'Net Banking'),
('PAY005', 'ORD006', '2024-08-06 10:45:00', 389.00, 'Cash'),
('PAY006', 'ORD008', '2024-08-08 12:15:00', 7399.00, 'Credit Card'),
('PAY007', 'ORD009', '2024-08-09 15:45:00', 2799.00, 'UPI'),
('PAY008', 'ORD010', '2024-08-10 17:15:00', 25249.00, 'Debit Card');

INSERT INTO Promotions VALUES 
('PROMO001', 'Independence Day Sale', 10.00, '2024-08-10', '2024-08-15', '2024-08-01 10:00:00'),
('PROMO002', 'Diwali Festive Offer', 20.00, '2024-10-20', '2024-11-05', '2024-08-01 10:00:00'),
('PROMO003', 'New Year Sale', 15.00, '2024-12-25', '2025-01-05', '2024-08-01 10:00:00'),
('PROMO004', 'Summer Clearance Sale', 25.00, '2024-05-01', '2024-05-15', '2024-08-01 10:00:00'),
('PROMO005', 'Republic Day Offer', 10.00, '2024-01-20', '2024-01-26', '2024-08-01 10:00:00'),
('PROMO006', 'Back to School', 5.00, '2024-06-01', '2024-06-15', '2024-08-01 10:00:00'),
('PROMO007', 'Monsoon Special', 12.00, '2024-07-01', '2024-07-15', '2024-08-01 10:00:00'),
('PROMO008', 'Christmas Bonanza', 18.00, '2024-12-20', '2024-12-25', '2024-08-01 10:00:00'),
('PROMO009', 'Ganesh Chaturthi Offer', 8.00, '2024-09-10', '2024-09-20', '2024-08-01 10:00:00'),
('PROMO010', 'Pongal Harvest Sale', 7.00, '2024-01-10', '2024-01-15', '2024-08-01 10:00:00');

INSERT INTO OrderPromotions VALUES 
('OP001', 'ORD001', 'PROMO001', 7059.90),
('OP002', 'ORD002', 'PROMO002', 504.00),
('OP003', 'ORD004', 'PROMO003', 2474.85),
('OP004', 'ORD005', 'PROMO004', 1875.00),
('OP005', 'ORD006', 'PROMO005', 38.90),
('OP006', 'ORD008', 'PROMO006', 369.95),
('OP007', 'ORD009', 'PROMO007', 335.88),
('OP008', 'ORD010', 'PROMO008', 4544.82);

INSERT INTO Shippers VALUES 
('SHIP001', 'Blue Dart', '9845098450', 'contact@bluedart.com', 'Marathahalli', 'Bangalore', 'Karnataka', '560037', '2024-08-01 10:00:00'),
('SHIP002', 'DTDC', '9835098350', 'support@dtdc.com', 'Andheri', 'Mumbai', 'Maharashtra', '400059', '2024-08-01 10:00:00'),
('SHIP003', 'Delhivery', '9825098250', 'info@delhivery.com', 'Dwarka', 'New Delhi', 'Delhi', '110075', '2024-08-01 10:00:00'),
('SHIP004', 'Ecom Express', '9815098150', 'help@ecomexpress.in', 'Banjara Hills', 'Hyderabad', 'Telangana', '500034', '2024-08-01 10:00:00'),
('SHIP005', 'Gati', '9805098050', 'service@gati.com', 'Salt Lake', 'Kolkata', 'West Bengal', '700064', '2024-08-01 10:00:00'),
('SHIP006', 'Xpressbees', '9795097950', 'contact@xpressbees.com', 'Velachery', 'Chennai', 'Tamil Nadu', '600042', '2024-08-01 10:00:00'),
('SHIP007', 'India Post', '9785097850', 'care@indiapost.gov.in', 'Connaught Place', 'New Delhi', 'Delhi', '110001', '2024-08-01 10:00:00'),
('SHIP008', 'Shadowfax', '9775097750', 'support@shadowfax.in', 'Koramangala', 'Bangalore', 'Karnataka', '560034', '2024-08-01 10:00:00'),
('SHIP009', 'FedEx', '9765097650', 'contact@fedex.com', 'Vashi', 'Navi Mumbai', 'Maharashtra', '400703', '2024-08-01 10:00:00'),
('SHIP010', 'Aramex', '9755097550', 'help@aramex.com', 'Juhu', 'Mumbai', 'Maharashtra', '400049', '2024-08-01 10:00:00');

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
