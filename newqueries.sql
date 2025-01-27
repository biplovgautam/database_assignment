Table CustomerDetails {
  CustomerId VARCHAR(10) [pk]
  FullName VARCHAR(100)
  Phone VARCHAR(15)
  Email VARCHAR(100)
  Address VARCHAR(255)
  Country VARCHAR(50)
  MembershipType INT
  RegistrationDate DATE
}

Table Membership {
  MembershipId INT [pk]
  MembershipType VARCHAR(50)
}

Table ProductDetails {
  ProductId VARCHAR(10) [pk]
  ProductName VARCHAR(100)
  CategoryId INT
  BrandId INT
  Price DECIMAL(10, 2)
}

Table ProductSuppliers {
  ProductId VARCHAR(10)
  SupplierId VARCHAR(10)
  ImportDate DATE
  PRIMARY KEY (ProductId, SupplierId)
}

Table BrandDetails {
  BrandId INT [pk]
  BrandName VARCHAR(100)
}

Table Category {
  CategoryId INT [pk]
  CategoryName VARCHAR(100)
}

Table Suppliers {
  SupplierId VARCHAR(10) [pk]
  SupplierName VARCHAR(100)
  ContactPerson VARCHAR(100)
  Phone VARCHAR(15)
  Email VARCHAR(100)
  LastDeliveryDate DATE
}

Table SupplierContact {
  SupplierId VARCHAR(10) [pk]
  ContactPerson VARCHAR(100)
  Phone VARCHAR(15)
  Email VARCHAR(100)
}

Table AddressDetails {
  AddressId VARCHAR(10) [pk]
  Address VARCHAR(255)
  CountryId VARCHAR(10)
}

Table SalesDetails {
  SalesId VARCHAR(10) [pk]
  Date DATE
  CustomerId VARCHAR(10)
  ProductId VARCHAR(10)
}

Table BillingInfo {
  SalesId VARCHAR(10) [pk]
  Quantity INT
  TotalAmount DECIMAL(10, 2)
  PaymentMethod VARCHAR(50)
  CashierName VARCHAR(100)
}

Table CustomerSales {
  SalesId VARCHAR(10)
  CustomerId VARCHAR(10)
  PRIMARY KEY (SalesId, CustomerId)
}

Table InventoryDetails {
  ProductId VARCHAR(10) [pk]
  StockQuantity INT
  ReorderLevel INT
  LastRestockDate DATE
}

Table WarehouseDetails {
  WarehouseId VARCHAR(10) [pk]
  WarehouseLocation VARCHAR(100)
}

Table Employees {
  EmployeeId VARCHAR(10) [pk]
  FullName VARCHAR(100)
  Phone VARCHAR(15)
  Email VARCHAR(100)
  HireDate DATE
}

Table Position {
  PositionId INT [pk]
  PositionName VARCHAR(100)
}

Table EmployeeDepartment {
  EmployeeId VARCHAR(10)
  DepartmentId VARCHAR(10)
  PRIMARY KEY (EmployeeId, DepartmentId)
}

Table Departments {
  DepartmentId VARCHAR(10) [pk]
  DepartmentName VARCHAR(100)
  Location VARCHAR(100)
  Budget DECIMAL(10, 2)
  ManagerId VARCHAR(10)
}

Table OrderDetails {
  OrderId VARCHAR(10) [pk]
  Date DATE
  TotalCost DECIMAL(10, 2)
  ExpectedDelivery DATE
}

Table OrderItems {
  OrderId VARCHAR(10)
  ProductId VARCHAR(10)
  Quantity INT
  PRIMARY KEY (OrderId, ProductId)
}

Table OrderCustomer {
  OrderId VARCHAR(10)
  CustomerId VARCHAR(10)
  PRIMARY KEY (OrderId, CustomerId)
}

Table PaymentDetails {
  PaymentId VARCHAR(10) [pk]
  Date DATE
  AmountPaid DECIMAL(10, 2)
  PaymentMethod VARCHAR(50)
  PaymentStatus VARCHAR(50)
}

Table PaymentOrder {
  PaymentId VARCHAR(10)
  OrderId VARCHAR(10)
  PRIMARY KEY (PaymentId, OrderId)
}

Table ReturnDetails {
  ReturnId VARCHAR(10) [pk]
  Date DATE
  SalesId VARCHAR(10)
  CustomerId VARCHAR(10)
  Reason VARCHAR(255)
  RefundAmount DECIMAL(10, 2)
}

Table ReturnProduct {
  ReturnId VARCHAR(10)
  ProductId VARCHAR(10)
  QuantityReturned INT
  PRIMARY KEY (ReturnId, ProductId)
}

Table RefundDetails {
  RefundId VARCHAR(10) [pk]
  ReturnId VARCHAR(10)
  RefundAmount DECIMAL(10, 2)
}

Table PromotionsDetails {
  PromotionId VARCHAR(10) [pk]
  PromotionName VARCHAR(100)
  StartDate DATE
  EndDate DATE
  TargetAudience VARCHAR(100)
}

Table PromotionProducts {
  PromotionId VARCHAR(10)
  ProductId VARCHAR(10)
  DiscountPercentage DECIMAL(5, 2)
  PRIMARY KEY (PromotionId, ProductId)
}

Table FeedbackDetails {
  FeedbackId VARCHAR(10) [pk]
  Date DATE
  CustomerId VARCHAR(10)
  EmployeeId VARCHAR(10)
  FeedbackText TEXT
  Rating INT
  FollowUpRequired BOOLEAN
}

Table CustomerFeedback {
  FeedbackId VARCHAR(10)
  CustomerId VARCHAR(10)
  PRIMARY KEY (FeedbackId, CustomerId)
}

Table EmployeeFeedback {
  FeedbackId VARCHAR(10)
  EmployeeId VARCHAR(10)
  PRIMARY KEY (FeedbackId, EmployeeId)
}

Table ManagerInfo {
  ManagerID INT [pk]
  Phone VARCHAR(15)
}

// Relationships
Ref: CustomerDetails.MembershipType > Membership.MembershipId
Ref: ProductDetails.CategoryId > Category.CategoryId
Ref: ProductDetails.BrandId > BrandDetails.BrandId
Ref: ProductSuppliers.ProductId > ProductDetails.ProductId
Ref: ProductSuppliers.SupplierId > Suppliers.SupplierId
Ref: SupplierContact.SupplierId > Suppliers.SupplierId
Ref: SalesDetails.CustomerId > CustomerDetails.CustomerId
Ref: SalesDetails.ProductId > ProductDetails.ProductId
Ref: BillingInfo.SalesId > SalesDetails.SalesId
Ref: CustomerSales.SalesId > SalesDetails.SalesId
Ref: CustomerSales.CustomerId > CustomerDetails.CustomerId
Ref: InventoryDetails.ProductId > ProductDetails.ProductId
Ref: EmployeeDepartment.EmployeeId > Employees.EmployeeId
Ref: EmployeeDepartment.DepartmentId > Departments.DepartmentId
Ref: Departments.ManagerId > Employees.EmployeeId
Ref: OrderItems.OrderId > OrderDetails.OrderId
Ref: OrderItems.ProductId > ProductDetails.ProductId
Ref: OrderCustomer.OrderId > OrderDetails.OrderId
Ref: OrderCustomer.CustomerId > CustomerDetails.CustomerId
Ref: PaymentOrder.PaymentId > PaymentDetails.PaymentId
Ref: PaymentOrder.OrderId > OrderDetails.OrderId
Ref: ReturnDetails.SalesId > SalesDetails.SalesId
Ref: ReturnDetails.CustomerId > CustomerDetails.CustomerId
Ref: ReturnProduct.ReturnId > ReturnDetails.ReturnId
Ref: ReturnProduct.ProductId > ProductDetails.ProductId
Ref: RefundDetails.ReturnId > ReturnDetails.ReturnId
Ref: PromotionProducts.PromotionId > PromotionsDetails.PromotionId
Ref: PromotionProducts.ProductId > ProductDetails.ProductId
Ref: FeedbackDetails.CustomerId > CustomerDetails.CustomerId
Ref: FeedbackDetails.EmployeeId > Employees.EmployeeId
Ref: CustomerFeedback.FeedbackId > FeedbackDetails.FeedbackId
Ref: CustomerFeedback.CustomerId > CustomerDetails.CustomerId
Ref: EmployeeFeedback.FeedbackId > FeedbackDetails.FeedbackId
Ref: EmployeeFeedback.EmployeeId > Employees.EmployeeId