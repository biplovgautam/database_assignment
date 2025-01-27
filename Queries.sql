Create database database_assignment234;
Use database_assignment234;
-- Customer Details Table
CREATE TABLE CustomerDetails (
    CustomerId VARCHAR(10) PRIMARY KEY,
    FullName VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255),
    Country VARCHAR(50),
    MembershipType INT,
    RegistrationDate DATE
);

-- Membership Table
CREATE TABLE Membership (
    MembershipId INT PRIMARY KEY,
    MembershipType VARCHAR(50)
);

-- Product Details Table
CREATE TABLE ProductDetails (
    ProductId VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryId INT,
    BrandId INT,
    Price DECIMAL(10, 2)
);

-- Product Details and Suppliers Table
CREATE TABLE ProductSuppliers (
    ProductId VARCHAR(10),
    SupplierId VARCHAR(10),
    ImportDate DATE,
    PRIMARY KEY (ProductId, SupplierId),
    FOREIGN KEY (ProductId) REFERENCES ProductDetails(ProductId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers(SupplierId)
);

-- Brand Details Table
CREATE TABLE BrandDetails (
    BrandId INT PRIMARY KEY,
    BrandName VARCHAR(100)
);

-- Category Table
CREATE TABLE Category (
    CategoryId INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

-- Suppliers Details Table
CREATE TABLE Suppliers (
    SupplierId VARCHAR(10) PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactPerson VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    LastDeliveryDate DATE
);

-- Supplier Contact Table
CREATE TABLE SupplierContact (
    SupplierId VARCHAR(10),
    ContactPerson VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    PRIMARY KEY (SupplierId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers(SupplierId)
);

-- Address Details Table
CREATE TABLE AddressDetails (
    AddressId VARCHAR(10) PRIMARY KEY,
    Address VARCHAR(255),
    CountryId VARCHAR(10)
);

-- Sales Details Table
CREATE TABLE SalesDetails (
    SalesId VARCHAR(10) PRIMARY KEY,
    Date DATE,
    CustomerId VARCHAR(10),
    ProductId VARCHAR(10),
    FOREIGN KEY (CustomerId) REFERENCES CustomerDetails(CustomerId),
    FOREIGN KEY (ProductId) REFERENCES ProductDetails(ProductId)
);

-- Billing Info Table
CREATE TABLE BillingInfo (
    SalesId VARCHAR(10),
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    CashierName VARCHAR(100),
    PRIMARY KEY (SalesId),
    FOREIGN KEY (SalesId) REFERENCES SalesDetails(SalesId)
);

-- Customer Sales Table
CREATE TABLE CustomerSales (
    SalesId VARCHAR(10),
    CustomerId VARCHAR(10),
    FOREIGN KEY (SalesId) REFERENCES SalesDetails(SalesId),
    FOREIGN KEY (CustomerId) REFERENCES CustomerDetails(CustomerId)
);

-- Inventory Details Table
CREATE TABLE InventoryDetails (
    ProductId VARCHAR(10),
    StockQuantity INT,
    ReorderLevel INT,
    LastRestockDate DATE,
    PRIMARY KEY (ProductId),
    FOREIGN KEY (ProductId) REFERENCES ProductDetails(ProductId)
);

-- Warehouse Details Table
CREATE TABLE WarehouseDetails (
    WarehouseId VARCHAR(10) PRIMARY KEY,
    WarehouseLocation VARCHAR(100)
);

-- Employees Details Table
CREATE TABLE Employees (
    EmployeeId VARCHAR(10) PRIMARY KEY,
    FullName VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    HireDate DATE
);

-- Position Table
CREATE TABLE Position (
    PositionId INT PRIMARY KEY,
    PositionName VARCHAR(100)
);

-- Employee Department Table
CREATE TABLE EmployeeDepartment (
    EmployeeId VARCHAR(10),
    DepartmentId VARCHAR(10),
    PRIMARY KEY (EmployeeId, DepartmentId),
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId),
    FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId)
);

-- Departments Details Table
CREATE TABLE Departments (
    DepartmentId VARCHAR(10) PRIMARY KEY,
    DepartmentName VARCHAR(100),
    Location VARCHAR(100),
    Budget DECIMAL(10, 2),
    ManagerId VARCHAR(10),
    FOREIGN KEY (ManagerId) REFERENCES Employees(EmployeeId)
);

-- Order Details Table
CREATE TABLE OrderDetails (
    OrderId VARCHAR(10) PRIMARY KEY,
    Date DATE,
    TotalCost DECIMAL(10, 2),
    ExpectedDelivery DATE
);

-- Order Items Table
CREATE TABLE OrderItems (
    OrderId VARCHAR(10),
    ProductId VARCHAR(10),
    Quantity INT,
    PRIMARY KEY (OrderId, ProductId),
    FOREIGN KEY (OrderId) REFERENCES OrderDetails(OrderId),
    FOREIGN KEY (ProductId) REFERENCES ProductDetails(ProductId)
);

-- Order Customer Table
CREATE TABLE OrderCustomer (
    OrderId VARCHAR(10),
    CustomerId VARCHAR(10),
    PRIMARY KEY (OrderId, CustomerId),
    FOREIGN KEY (OrderId) REFERENCES OrderDetails(OrderId),
    FOREIGN KEY (CustomerId) REFERENCES CustomerDetails(CustomerId)
);

-- Payment Details Table
CREATE TABLE PaymentDetails (
    PaymentId VARCHAR(10) PRIMARY KEY,
    Date DATE,
    AmountPaid DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    PaymentStatus VARCHAR(50)
);

-- Payment Order Table
CREATE TABLE PaymentOrder (
    PaymentId VARCHAR(10),
    OrderId VARCHAR(10),
    PRIMARY KEY (PaymentId, OrderId),
    FOREIGN KEY (PaymentId) REFERENCES PaymentDetails(PaymentId),
    FOREIGN KEY (OrderId) REFERENCES OrderDetails(OrderId)
);

-- Return Details Table
CREATE TABLE ReturnDetails (
    ReturnId VARCHAR(10) PRIMARY KEY,
    Date DATE,
    SalesId VARCHAR(10),
    CustomerId VARCHAR(10),
    Reason VARCHAR(255),
    RefundAmount DECIMAL(10, 2),
    FOREIGN KEY (SalesId) REFERENCES SalesDetails(SalesId),
    FOREIGN KEY (CustomerId) REFERENCES CustomerDetails(CustomerId)
);

-- Return Product Table
CREATE TABLE ReturnProduct (
    ReturnId VARCHAR(10),
    ProductId VARCHAR(10),
    QuantityReturned INT,
    PRIMARY KEY (ReturnId, ProductId),
    FOREIGN KEY (ReturnId) REFERENCES ReturnDetails(ReturnId),
    FOREIGN KEY (ProductId) REFERENCES ProductDetails(ProductId)
);

-- Refund Details Table
CREATE TABLE RefundDetails (
    RefundId VARCHAR(10) PRIMARY KEY,
    ReturnId VARCHAR(10),
    RefundAmount DECIMAL(10, 2),
    FOREIGN KEY (ReturnId) REFERENCES ReturnDetails(ReturnId)
);

-- Promotions Details Table
CREATE TABLE PromotionsDetails (
    PromotionId VARCHAR(10) PRIMARY KEY,
    PromotionName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    TargetAudience VARCHAR(100)
);

-- Promotion Products Table
CREATE TABLE PromotionProducts (
    PromotionId VARCHAR(10),
    ProductId VARCHAR(10),
    DiscountPercentage DECIMAL(5, 2),
    PRIMARY KEY (PromotionId, ProductId),
    FOREIGN KEY (PromotionId) REFERENCES PromotionsDetails(PromotionId),
    FOREIGN KEY (ProductId) REFERENCES ProductDetails(ProductId)
);

-- Feedback Details Table
CREATE TABLE FeedbackDetails (
    FeedbackId VARCHAR(10) PRIMARY KEY,
    Date DATE,
    CustomerId VARCHAR(10),
    EmployeeId VARCHAR(10),
    FeedbackText TEXT,
    Rating INT,
    FollowUpRequired BOOLEAN,
    FOREIGN KEY (CustomerId) REFERENCES CustomerDetails(CustomerId),
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
);

-- Customer Feedback Table
CREATE TABLE CustomerFeedback (
    FeedbackId VARCHAR(10),
    CustomerId VARCHAR(10),
    PRIMARY KEY (FeedbackId, CustomerId),
    FOREIGN KEY (FeedbackId) REFERENCES FeedbackDetails(FeedbackId),
    FOREIGN KEY (CustomerId) REFERENCES CustomerDetails(CustomerId)
);

-- Employee Feedback Table
CREATE TABLE EmployeeFeedback (
    FeedbackId VARCHAR(10),
    EmployeeId VARCHAR(10),
    PRIMARY KEY (FeedbackId, EmployeeId),
    FOREIGN KEY (FeedbackId) REFERENCES FeedbackDetails(FeedbackId),
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
);
CREATE TABLE ManagerInfo (
    ManagerID INT PRIMARY KEY,
    Phone VARCHAR(15)
);

-- Insert into CustomerDetails table
INSERT INTO CustomerDetails (CustomerId, FullName, Phone, Email, Address, Country, MembershipType, RegistrationDate) 
VALUES 
('C001', 'Ram Shrestha', '9841234567', 'ram@gmail.com', 'Kathmandu, Nepal', 'Nepal', 1, '2022-01-15'),
('C002', 'Sita Sharma', '9812345678', 'sita@gmail.com', 'Pokhara', 'Nepal', 2, '2021-05-22'),
('C003', 'Hari Bhattarai', '9801122334', 'hari@gmail.com', 'Lalitpur', 'Nepal', 3, '2020-11-10'),
('C004', 'Gita Rai', '9856543210', 'gita@outlook.com', 'Bhaktapur', 'Nepal', 1, '2021-07-19'),
('C005', 'Nabin Karki', '9807654321', 'nabin@gmail.com', 'Chitwan', 'Nepal', 2, '2023-03-30'),
('C006', 'Sarita Giri', '9841123456', 'sarita@gmail.com', 'Hetauda', 'Nepal', 3, '2020-08-25');

Select * from  CustomerDetails;

-- Insert into Membership table
INSERT INTO Membership (MembershipId, MembershipType)
VALUES 
(1, 'Gold'),
(2, 'Silver'),
(3, 'Platinum');
Select * from Membership;

-- Insert into ProductDetails table
INSERT INTO ProductDetails (ProductId, ProductName, CategoryId, BrandId, Price)
VALUES 
('P001', 'Rice 10kg', 1, 1, 1200),
('P002', 'iPhone 14 Pro', 2, 2, 150000),
('P003', 'LED TV 42 inches', 2, 3, 55000),
('P004', 'Milk 1L', 3, 4, 100),
('P005', 'Wheat Flour 5kg', 1, 5, 600),
('P006', 'Detergent Powder 1kg', 4, 6, 200),
('P007', 'Laptop HP Pavilion', 3, 7, 80000);
Select * from ProductDetails;

-- Insert into ProductSuppliers table
INSERT INTO ProductSuppliers (ProductId, SupplierId, ImportDate)
VALUES 
('P001', 'S001', '2024-06-10'),
('P002', 'S002', '2024-05-05'),
('P003', 'S003', '2024-06-01'),
('P004', 'S004', '2024-07-11'),
('P005', 'S001', '2024-06-15'),
('P006', 'S005', '2024-06-20'),
('P007', 'S002', '2024-04-22');
Select * from  ProductSuppliers;


-- Insert into BrandDetails table
INSERT INTO BrandDetails (BrandId, BrandName)
VALUES 
(1, 'ABC Rice'),
(2, 'Apple'),
(3, 'Samsung'),
(4, 'DDC'),
(5, 'XYZ Flour'),
(6, 'CleanX'),
(7, 'HP');
 Select * from BrandDetails;

-- Insert into Category table
INSERT INTO Category (CategoryId, CategoryName)
VALUES 
(1, 'Food'),
(2, 'Electronics'),
(3, 'Dairy'),
(4, 'Household Goods');
Select * from Category;

-- Insert into Suppliers table
INSERT INTO Suppliers (SupplierId, SupplierName, ContactPerson, Phone, Email, LastDeliveryDate)
VALUES 
('S001', 'ABC Distributors', 'Ramesh Tiwari', '9801234567', 'ramesh@abcdistrib.com', '2024-06-15'),
('S002', 'Tech Innovators', 'Sushil Manandhar', '9845678901', 'sushil@techinnov.com', '2024-05-05'),
('S003', 'Samsung Nepal', 'Hari Khadka', '9812345678', 'hari@samsung.com.np', '2024-06-01'),
('S004', 'DDC', 'Sunita Sharma', '9807654321', 'sunita@ddc.com', '2024-07-11'),
('S005', 'CleanX Supplies', 'Ramila Shrestha', '9851234567', 'ramila@cleanx.com', '2024-06-20'),
('S006', 'HP Nepal', 'Bimal Rai', '9843210987', 'bimal@hpnepal.com', '2024-04-22');
Select * from Suppliers;


-- Insert into SupplierContact table
INSERT INTO SupplierContact (SupplierId, ContactPerson, Phone, Email)
VALUES 
('S001', 'Ramesh Tiwari', '9801234567', 'ramesh@abcdistrib.com'),
('S002', 'Sushil Manandhar', '9845678901', 'sushil@techinnov.com'),
('S003', 'Hari Khadka', '9812345678', 'hari@samsung.com.np'),
('S004', 'Sunita Sharma', '9807654321', 'sunita@ddc.com'),
('S005', 'Ramila Shrestha', '9851234567', 'ramila@cleanx.com'),
('S006', 'Bimal Rai', '9843210987', 'bimal@hpnepal.com');
Select * from SupplierContact;

-- Insert into AddressDetails table
INSERT INTO AddressDetails (AddressId, Address, CountryId)
VALUES 
('A01', 'Kathmandu', 'N001'),
('A02', 'Lalitpur', 'N002'),
('A03', 'Bhaktapur', 'N003'),
('A04', 'Hetauda', 'N004'),
('A05', 'Pokhara', 'N005');
Select * from AddressDetails;

-- Insert into SalesDetails table
INSERT INTO SalesDetails (SalesId, Date, CustomerId, ProductId)
VALUES 
('S001', '2024-08-10', 'C001', 'P001'),
('S002', '2024-08-11', 'C003', 'P002'),
('S003', '2024-08-12', 'C004', 'P003'),
('S004', '2024-08-13', 'C002', 'P004'),
('S005', '2024-08-14', 'C005', 'P005'),
('S006', '2024-08-15', 'C006', 'P007');
Select * from SalesDetails;

-- Insert into BillingInfo table
INSERT INTO BillingInfo (SalesId, Quantity, TotalAmount, PaymentMethod, CashierName)
VALUES 
('S001', 1, 1200, 'Cash', 'Santosh Koirala'),
('S002', 1, 150000, 'Credit Card', 'Sita Sharma'),
('S003', 1, 55000, 'Debit Card', 'Hari Gurung'),
('S004', 5, 500, 'Cash', 'Gita Rai'),
('S005', 2, 1200, 'Mobile Payment', 'Sarita Giri'),
('S006', 1, 80000, 'Credit Card', 'Nabin Karki');
Select * from BillingInfo;

-- Insert into CustomerSales table
INSERT INTO CustomerSales (SalesId, CustomerId)
VALUES 
('S001', 'C001'),
('S002', 'C003'),
('S003', 'C004'),
('S004', 'C002'),
('S005', 'C005'),
('S006', 'C006');
Select * from CustomerSales;

-- Insert into InventoryDetails table
INSERT INTO InventoryDetails (ProductId, StockQuantity, ReorderLevel, LastRestockDate)
VALUES 
('P001', 50, 10, '2024-06-15'),
('P002', 10, 5, '2024-05-05'),
('P003', 20, 7, '2024-06-01'),
('P004', 200, 50, '2024-07-11'),
('P005', 75, 20, '2024-06-15'),
('P006', 100, 30, '2024-06-20'),
('P007', 15, 5, '2024-04-22');
Select * from InventoryDetails;

-- Insert into WarehouseDetails table
INSERT INTO WarehouseDetails (WarehouseId, WarehouseLocation)
VALUES 
('W001', 'Warehouse A'),
('W002', 'Warehouse B'),
('W003', 'Warehouse C'),
('W004', 'Warehouse D'),
('W005', 'Warehouse E');
Select * from WarehouseDetails;

-- Inserting into Employees table
INSERT INTO Employees (EmployeeId, FullName, Phone, Email, HireDate)
VALUES 
('E001', 'Santosh Koirala', '9841234567', 'santosh@bhatbhateni.com', '2022-01-15'),
('E002', 'Sita Sharma', '9812345678', 'sita@bhatbhateni.com', '2021-05-22'),
('E003', 'Hari Gurung', '9801122334', 'hari@bhatbhateni.com', '2020-11-10'),
('E004', 'Gita Rai', '9856543210', 'gita@bhatbhateni.com', '2021-07-19'),
('E005', 'Nabin Karki', '9807654321', 'nabin@bhatbhateni.com', '2023-03-30'),
('E006', 'Sarita Giri', '9841123456', 'sarita@bhatbhateni.com', '2020-08-25');
Select * from Employees;

-- Inserting into Position table
INSERT INTO Position (PositionId, PositionName)
VALUES 
(1, 'Cashier'),
(2, 'Sales Executive'),
(3, 'Inventory Manager'),
(4, 'IT Support'),
(5, 'Customer Service');
Select * from Position;

-- Inserting into EmployeeDepartment table
INSERT INTO EmployeeDepartment (EmployeeId, DepartmentId)
VALUES 
('E001', 'D001'),
('E002', 'D001'),
('E003', 'D002'),
('E004', 'D001'),
('E005', 'D003'),
('E006', 'D004');
Select * from EmployeeDepartment;

-- Inserting into Departments table
INSERT INTO Departments (DepartmentId, DepartmentName, Location, Budget, ManagerId)
VALUES 
('D001', 'Sales', 'Main Building', 5000000, 'E002'),
('D002', 'Inventory', 'Warehouse A', 3000000, 'E003'),
('D003', 'IT', 'Main Office', 2000000, 'E005'),
('D004', 'Customer Care', 'Main Building', 1000000, 'E006'),
('D005', 'HR', 'Main Office', 1500000, 'E004'),
('D006', 'Procurement', 'Procurement Office', 4000000, 'E001');
Select * from Departments;

-- Inserting into OrderDetails table
INSERT INTO OrderDetails (OrderId, Date, TotalCost, ExpectedDelivery)
VALUES 
('O001', '2024-06-15', 120000, '2024-06-20'),
('O002', '2024-05-05', 3000000, '2024-05-10'),
('O003', '2024-06-01', 2750000, '2024-06-05'),
('O004', '2024-07-11', 50000, '2024-07-15'),
('O005', '2024-06-15', 120000, '2024-06-20'),
('O006', '2024-06-20', 30000, '2024-06-25');
Select * from OrderDetails;

-- Inserting into OrderItems table
INSERT INTO OrderItems (OrderId, ProductId, Quantity)
VALUES 
('O001', 'P001', 100),
('O002', 'P002', 20),
('O003', 'P003', 50),
('O004', 'P004', 500),
('O005', 'P005', 200),
('O006', 'P006', 150);
Select * from OrderItems;

-- Inserting into OrderCustomer table
INSERT INTO OrderCustomer (OrderId, CustomerId)
VALUES 
('O001', 'C001'),
('O002', 'C002'),
('O003', 'C003'),
('O004', 'C004'),
('O005', 'C005'),
('O006', 'C006');
Select * from OrderCustomer;

-- Inserting into PaymentDetails table
INSERT INTO PaymentDetails (PaymentId, Date, AmountPaid, PaymentMethod, PaymentStatus)
VALUES 
('PAY001', '2024-06-20', 120000, 'Cash', 'Completed'),
('PAY002', '2024-05-10', 3000000, 'Credit Card', 'Completed'),
('PAY003', '2024-06-05', 2750000, 'Bank Transfer', 'Completed'),
('PAY004', '2024-07-15', 50000, 'Mobile Payment', 'Completed'),
('PAY005', '2024-06-20', 120000, 'Debit Card', 'Completed'),
('PAY006', '2024-06-25', 30000, 'Cash', 'Completed');
Select * from PaymentDetails;

-- Inserting into PaymentOrder table
INSERT INTO PaymentOrder (PaymentId, OrderId)
VALUES 
('PAY001', 'O001'),
('PAY002', 'O002'),
('PAY003', 'O003'),
('PAY004', 'O004'),
('PAY005', 'O005'),
('PAY006', 'O006');
Select * from PaymentOrder;

-- Inserting into ReturnDetails table
INSERT INTO ReturnDetails (ReturnId, Date, SalesId, CustomerId, Reason, RefundAmount)
VALUES 
('R001', '2024-08-12', 'S002', 'C003', 'Defective Product', 150000),
('R002', '2024-08-15', 'S006', 'C006', 'Wrong Item', 80000),
('R003', '2024-08-14', 'S005', 'C005', 'Poor Quality', 1200),
('R004', '2024-08-13', 'S004', 'C002', 'Expired Product', 500),
('R005', '2024-08-11', 'S003', 'C004', 'Not as Described', 55000),
('R006', '2024-08-10', 'S001', 'C001', 'Damaged', 1200);
Select * from ReturnDetails;

-- Inserting into ReturnProduct table
INSERT INTO ReturnProduct (ReturnId, ProductId, QuantityReturned)
VALUES 
('R001', 'P002', 1),
('R002', 'P007', 1),
('R003', 'P005', 2),
('R004', 'P004', 5),
('R005', 'P003', 1),
('R006', 'P001', 1);
Select * from ReturnProduct;

-- Inserting into RefundDetails table
INSERT INTO RefundDetails (RefundId, ReturnId, RefundAmount)
VALUES 
('R1', 'R001', 150000),
('R2', 'R002', 80000),
('R3', 'R003', 1200),
('R4', 'R004', 500),
('R5', 'R005', 55000),
('R6', 'R006', 1200);
Select * from RefundDetails;

-- Inserting into PromotionsDetails table
INSERT INTO PromotionsDetails (PromotionId, PromotionName, StartDate, EndDate, TargetAudience)
VALUES 
('PR001', 'Dashain Offer', '2024-09-01', '2024-09-30', 'All Customers'),
('PR002', 'Electronics Sale', '2024-08-01', '2024-08-31', 'Members Only'),
('PR003', 'Back to School', '2024-07-15', '2024-08-15', 'Parents'),
('PR004', 'Summer Sale', '2024-06-01', '2024-06-30', 'All Customers'),
('PR005', 'New Year Offer', '2024-12-15', '2024-12-31', 'All Customers'),
('PR006', 'Loyalty Bonus', '2024-08-01', '2024-08-15', 'Loyalty Members');
Select * from PromotionsDetails;

-- Inserting into PromotionProducts table
INSERT INTO PromotionProducts (PromotionId, ProductId, DiscountPercentage)
VALUES 
('PR001', 'P001', 10),
('PR002', 'P002', 15),
('PR003', 'P005', 5),
('PR004', 'P006', 20),
('PR005', 'P007', 25),
('PR006', 'P003', 5);
Select * from  PromotionProducts;

-- Inserting into ManagerInfo table
INSERT INTO ManagerInfo (ManagerID, Phone)
VALUES 
(2, '9841234567'),
(3, '9812345678'),
(5, '9801122334'),
(6, '9856543210'),
(4, '9807654321'),
(1, '9841123456');
Select * from ManagerInfo;

-- Inserting into FeedbackDetails table
INSERT INTO FeedbackDetails (FeedbackId, Date, CustomerId, EmployeeId, FeedbackText, Rating, FollowUpRequired)
VALUES 
('F001', '2024-08-10', 'C001', 'E006', 'Excellent service by staff', 5, 0),
('F002', '2024-08-11', 'C002', 'E004', 'Good product selection', 4, 0),
('F003', '2024-08-12', 'C003', 'E005', 'Poor website experience', 2, 1),
('F004', '2024-08-13', 'C004', 'E003', 'Inventory not up to date', 3, 1),
('F005', '2024-08-14', 'C005', 'E002', 'Friendly and helpful staff', 5, 0),
('F006', '2024-08-15', 'C006', 'E001', 'Quick and easy checkout process', 4, 0);
Select * from FeedbackDetails;

-- Inserting into CustomerFeedback table
INSERT INTO CustomerFeedback (FeedbackId, CustomerId)
VALUES 
('F001', 'C001'),
('F002', 'C002'),
('F003', 'C003'),
('F004', 'C004'),
('F005', 'C005'),
('F006', 'C006');
Select * from CustomerFeedback;

-- Inserting into EmployeeFeedback table
INSERT INTO EmployeeFeedback (FeedbackId, EmployeeId)
VALUES 
('F001', 'E006'),
('F002', 'E004'),
('F003', 'E005'),
('F004', 'E003'),
('F005', 'E002'),
('F006', 'E001');
Select * from EmployeeFeedback;

-- question 2
UPDATE ProductDetails
SET Price = Price * 1.10
WHERE CategoryId = (SELECT CategoryId FROM Category WHERE CategoryName = 'Electronics');
Select * from ProductDetails;

-- question 3
DELETE FROM SalesDetails
WHERE SalesId IN (
    SELECT SalesId
    FROM BillingInfo
    WHERE TotalAmount < 500
);
Select * from SalesDetails;

-- question 4
-- first inserting brand details
INSERT INTO BrandDetails (BrandId, BrandName)
VALUES (8, 'Lenovo');
-- insert new category
INSERT INTO Category (CategoryId, CategoryName)
VALUES (5, 'Computers');
-- insert new product detail
INSERT INTO ProductDetails (ProductId, ProductName, CategoryId, BrandId, Price)
VALUES ('P009', 'Lenovo ThinkPad', 5, 8, 60000);
-- Link the product to the supplier
INSERT INTO ProductSuppliers (ProductId, SupplierId, ImportDate)
VALUES ('P009', 'S002', '2024-08-01');
-- Update the inventory details
INSERT INTO InventoryDetails (ProductId, StockQuantity, ReorderLevel, LastRestockDate)
VALUES ('P009', 100, 20, '2024-08-01');

select * from ProductDetail;


-- Question 5: Retrieve a report of total sales by each employee, including the total amount handled and the number of transactions.
SELECT 
    CashierName AS Employee,
    COUNT(SalesId) AS TotalTransactions,
    SUM(TotalAmount) AS TotalSalesAmount
FROM 
    BillingInfo
GROUP BY 
    CashierName;
    
-- Question 6: Perform bulk updates to adjust the stock quantity of all products to reflect a decrease of 15% due to inventory shrinkage.
START TRANSACTION;

UPDATE InventoryDetails
SET StockQuantity = ROUND(StockQuantity * 0.85)
WHERE StockQuantity IS NOT NULL;

COMMIT;
Select * from InventoryDetails;

-- Question 7: Perform a SELECT query with multiple JOINs involving at least 4 tables, applying various conditions and filters.
-- Updated Query with Correct Table Name for Customers
SELECT 
    s.SalesID,
    c.FullName AS CustomerName,
    p.ProductName,
    p.Price,
    b.TotalAmount,
    b.PaymentMethod,
    e.FullName AS CashierName,
    s.Date AS SaleDate
FROM 
    SalesDetails s
JOIN 
    CustomerDetails c ON s.CustomerID = c.CustomerID
JOIN 
    ProductDetails p ON s.ProductID = p.ProductID
JOIN 
    BillingInfo b ON s.SalesID = b.SalesID
JOIN 
    Employees e ON b.CashierName = e.FullName
WHERE 
    b.TotalAmount > 1000 -- Filter for transactions over 1000
    AND b.PaymentMethod = 'Credit Card' -- Filter for credit card payments
    AND p.CategoryId = 2 -- Filter for Electronics category
ORDER BY 
    b.TotalAmount DESC -- Sort by total amount in descending order
LIMIT 
    1000; -- Limit results to 1000 rows

-- Question 8: Report with aggregate functions
SELECT 
    c.CategoryId,
    c.CategoryName,
    COUNT(s.SalesID) AS TotalTransactions,
    SUM(b.TotalAmount) AS TotalSalesAmount,
    AVG(b.TotalAmount) AS AverageSalesAmount
FROM 
    ProductDetails p
JOIN 
    SalesDetails s ON p.ProductID = s.ProductID
JOIN 
    BillingInfo b ON s.SalesID = b.SalesID
JOIN 
    Category c ON p.CategoryId = c.CategoryId
GROUP BY 
    c.CategoryId, c.CategoryName
ORDER BY 
    TotalSalesAmount DESC;
    
    -- Question 9: Customers purchasing only Electronics
SELECT 
    DISTINCT c.CustomerId,
    c.FullName,
    c.Phone,
    c.Email,
    c.Address,
    c.Country,
    c.MembershipType,
    c.RegistrationDate
FROM 
    Customers c
JOIN 
    SalesDetails s ON c.CustomerId = s.CustomerId
JOIN 
    ProductDetails p ON s.ProductId = p.ProductId
JOIN 
    Category cat ON p.CategoryId = cat.CategoryId
WHERE 
    cat.CategoryName = 'Electronics'
    AND NOT EXISTS (
        SELECT 1
        FROM SalesDetails s2
        JOIN ProductDetails p2 ON s2.ProductId = p2.ProductId
        JOIN Category cat2 ON p2.CategoryId = cat2.CategoryId
        WHERE 
            s2.CustomerId = c.CustomerId
            AND cat2.CategoryName != 'Electronics'
    );
-- Question 9: Customers purchasing only Electronics
SELECT 
    DISTINCT c.CustomerId,
    c.FullName,
    c.Phone,
    c.Email,
    c.Address,
    c.Country,
    c.MembershipType,
    c.RegistrationDate
FROM 
    CustomerDetails c
JOIN 
    SalesDetails s ON c.CustomerId = s.CustomerId
JOIN 
    ProductDetails p ON s.ProductId = p.ProductId
JOIN 
    Category cat ON p.CategoryId = cat.CategoryId
WHERE 
    cat.CategoryName = 'Electronics'
    AND NOT EXISTS (
        SELECT 1
        FROM SalesDetails s2
        JOIN ProductDetails p2 ON s2.ProductId = p2.ProductId
        JOIN Category cat2 ON p2.CategoryId = cat2.CategoryId
        WHERE 
            s2.CustomerId = c.CustomerId
            AND cat2.CategoryName != 'Electronics'
    );