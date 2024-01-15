-- Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    Surname VARCHAR(50),
    BirthDate DATE,
    Gender CHAR(1) CHECK (Gender IN ('F', 'M')),
    ContactNumber VARCHAR(15)
);

-- Apple Account Table
CREATE TABLE AppleAccount (
    AppleID INT PRIMARY KEY,
    EmailAddress VARCHAR(255) UNIQUE,
    CustomerID INT UNIQUE,
    Password VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Product Table
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    PricePerUnit DECIMAL(10,2),
    Category VARCHAR(50)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDateTime TIMESTAMP,
    CustomerID INT,
    ProductID INT,
    EmployeeID INT,
    PaymentType VARCHAR(50),
    ShippingOption VARCHAR(50),
    ShippingID INT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (ShippingID) REFERENCES ShippingDetails(ShippingID)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender CHAR(1) CHECK (Gender IN ('F', 'M')),
    Birthdate DATE,
    Contact VARCHAR(15),
    PremiseID INT,
    DateHired DATE,
    DateResigned DATE NULL,
    Position VARCHAR(50),
    SuperiorEmployeeID INT NULL,
    MonthlySalary DECIMAL(10,2),
    FOREIGN KEY (PremiseID) REFERENCES Premise(PremiseID),
    FOREIGN KEY (SuperiorEmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Premise (
    PremiseID INT PRIMARY KEY,
    Type VARCHAR(50) CHECK (Type IN ('Office', 'Store', 'Warehouse')),
    Address VARCHAR(255)
);

CREATE TABLE ProductStock (
    ProductID INT,
    PremiseID INT,
    Quantity INT,
    PRIMARY KEY (ProductID, PremiseID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (PremiseID) REFERENCES Premise(PremiseID)
);

CREATE TABLE MailshotCampaign (
    MailshotID INT PRIMARY KEY,
    Name VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Outcome VARCHAR(50)
);

CREATE TABLE ShippingDetails (
    ShippingID INT PRIMARY KEY,
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Postcode VARCHAR(10),
    Country VARCHAR(50)
);

