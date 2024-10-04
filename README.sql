TELECOMMUNICATION MANAGEMENT DATABASE
  This README provide an overview of the telecommunication management database where a client is able to subscribe on a certain plan.
  
Creating the Customers table
  -------------------------------------
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL
);

  Creating the Plans table
  ---------------------------------
CREATE TABLE Plans (
    PlanID INT PRIMARY KEY,
    PlanName VARCHAR(100) NOT NULL, 
    Monthlyfee DECIMAL(10, 2) NOT NULL
);

 Creating the Subscriptions table
   ----------------------------------
CREATE TABLE Subscriptions (
    SubscriptionID INT PRIMARY KEY,
    CustomerID INT,
    PlanID INT,
    StartDate DATE NOT NULL,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (PlanID) REFERENCES Plans(PlanID)
);

Inserting data into Customers table
  ---------------------------------------
INSERT INTO Customers (CustomerID, Name, Email, Phone)
values (1, 'Mireille', 'kmireille3@gmail.com', '23456');

INSERT INTO Customers (CustomerID, Name, Email, Phone)
values (2, 'Getrude', 'ugetrude@gmail.com', '14576');

INSERT INTO Customers (CustomerID, Name, Email, Phone)
values (3, 'Nadine', 'inadine4@gmail.com', '04578');

INSERT INTO Customers (CustomerID, Name, Email, Phone)
values (4,'Nooella','dnoella','98756');

Inserting data into Plans table
  --------------------------------
INSERT INTO Plans (PlanID, PlanName, Plantype, Monthlyfee) 
values (1, 'Basic', 200);

INSERT INTO Plans (PlanID, PlanName, Plantype,Monthlyfee) 
values(2, 'Premium', 500);

INSERT INTO Plans (PlanID, PlanName, Plantype, Monthlyfee) 
values(3, 'Classic', 600);

INSERT INTO Plans (PlanID, PlanName, Plantype, Monthlyfee) 
values(4, 'Unique', 800);

Inserting data into Subscriptions table
  ----------------------------------------------
INSERT INTO Subscriptions (SubscriptionID, CustomerID, PlanID, StartDate, EndDate) 
VALUES (1, 1, 1, to_date( '2024-01-01', 'yyyy-mm-dd'), to_date( '2024-02-01', ' yyyy-mm-dd'));
  
INSERT INTO Subscriptions (SubscriptionID, CustomerID, PlanID, StartDate, EndDate) 
VALUES (2, 2, 4, to_date( '2024-05-01', 'yyyy-mm-dd'), to_date( '2024-06-01', 'yyyy-mm-dd'));

INSERT INTO Subscriptions (SubscriptionID, CustomerID, PlanID, StartDate, EndDate) 
VALUES (3, 3, 3, to_date( '2024-01-21', 'yyyy-mm-dd'), to_date( '2024-02-21', 'yyyy-mm-dd'));

INSERT INTO Subscriptions (SubscriptionID, CustomerID, PlanID, StartDate, EndDate) 
VALUES(4, 4, 2, to_date( '2024-10-01', 'yyyy-mm-dd'), to_date( '2024-11-01', 'yyyy-mm-dd'));

Updating
  -------------
UPDATE Customers SET Email = 'anadine@gmail.com'
WHERE CustomerID = 3;

Deleting 
  -------------
DELETE FROM Subscriptions 
WHERE CustomerID = 1;

joining
  -------------
SELECT c.Name, p.PlanName, s.StartDate 
FROM Customers c
JOIN Subscriptions s ON c.CustomerID = s.CustomerID
JOIN Plans p ON s.PlanID = p.PlanID;

Retrieve
  -----------
SELECT Name FROM Customers 
WHERE CustomerID IN (
    SELECT CustomerID FROM Plan
WHERE Monthlyfee > (SELECT AVG(Monthlyfee) FROM Plans)
  );












 

  



