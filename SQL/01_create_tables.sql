CREATE TABLE IF NOT EXISTS customers(
    customer_id	INTEGER	Primary Key,
    customer_name	VARCHAR(100)	NOT NULL,
    email	VARCHAR(100)	UNIQUE,
    phone	VARCHAR(15),
    created_date	DATE
);    


CREATE TABLE IF NOT EXISTS accounts(
    account_id	INTEGER	Primary Key,
    customer_id	INTEGER REFERENCES customers(customer_id),
    account_type	VARCHAR(20),	
    balance	DECIMAL(12,2),
    status	VARCHAR(20)
);




	
