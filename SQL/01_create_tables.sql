CREATE TABLE IF NOT EXIST customers(
    customer_id	INT	Primary Key,
    customer_name	VARCHAR2(100)	NOT NULL,
    email	VARCHAR2(100)	UNIQUE,
    phone	VARCHAR2(15),
    created_date	DATE
);    


CREATE TABLE IF NOT EXIST accounts(
    account_id	INT	Primary Key,
    customer_id	INT	Foreign Key REFERENCES customers(customer_id),
    account_type	VARCHAR2(20),	
    balance	INT(12,2),
    status	VARCHAR2(20)
);




	
