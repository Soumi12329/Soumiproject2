CREATE TABLE Customers(
    customer_id	INT	Primary Key,
    customer_name	VARCHAR2(100)	NOT NULL,
    email	VARCHAR2(100)	UNIQUE,
    phone	VARCHAR2(15),
    created_date	DATE
);    


CREATE TABLE Accounts(
    Account_id	INT	Primary Key,
    Customer_id	INT	Foreign Key REFERENCES Customers(customer_id),
    Account_type	VARCHAR2(20),	
    Balance	INT(12,2),
    Status	VARCHAR2(20)
);




	
