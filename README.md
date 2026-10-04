those are the data need to insert:

Customers
| customer_id | customer_name | email                                                     | phone      | created_date |
| ----------: | ------------- | --------------------------------------------------------- | ---------- | ------------ |
|           1 | John Smith    | [john.smith@gmail.com](mailto:john.smith@gmail.com)       | 9876543210 | 2026-01-10   |
|           2 | David Miller  | [david.miller@gmail.com](mailto:david.miller@gmail.com)   | 9876543211 | 2026-02-15   |
|           3 | Sarah Wilson  | [sarah.wilson@gmail.com](mailto:sarah.wilson@gmail.com)   | 9876543212 | 2026-03-20   |
|           4 | Robert Brown  | [robert.brown@gmail.com](mailto:robert.brown@gmail.com)   | 9876543213 | 2026-04-05   |
|           5 | Alice Johnson | [alice.johnson@gmail.com](mailto:alice.johnson@gmail.com) | 9876543214 | 2026-05-12   |

Accounts:
| account_id | customer_id | account_type | balance | status |
| ---------: | ----------: | ------------ | ------: | ------ |
|        101 |           1 | SAVINGS      |   50000 | ACTIVE |
|        102 |           1 | CURRENT      |   30000 | ACTIVE |
|        103 |           2 | SAVINGS      |   45000 | ACTIVE |
|        104 |           3 | SALARY       |   60000 | ACTIVE |
|        105 |           3 | SAVINGS      |   25000 | ACTIVE |
|        106 |           4 | CURRENT      |   75000 | ACTIVE |
|        107 |           5 | SAVINGS      |   35000 | ACTIVE |


PL/SQL Developer Task
Scenario
You are working as a PL/SQL Developer for a banking application.
The database team wants you to create a small Customer Account Management module.
Your task is to create the database objects in separate SQL files, execute them using a Linux shell script, test the functionality, and push the complete code to GitHub.

Project structure

Create the following structure:

banking-db/
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   ├── 03_create_procedure.sql
│   └── 04_create_function.sql
│
├── run.sh
└── README.md

Question
File 1 — 01_create_tables.sql

Create the following tables.

customers:
Column	Type	Requirement
customer_id	NUMBER	Primary Key
customer_name	VARCHAR2(100)	NOT NULL
email	VARCHAR2(100)	UNIQUE
phone	VARCHAR2(15)	
created_date	DATE	

accounts:
Column	Type	Requirement
account_id	NUMBER	Primary Key
customer_id	NUMBER	Foreign Key
account_type	VARCHAR2(20)	
balance	NUMBER(12,2)	
status	VARCHAR2(20)	

Hint
You need:
CREATE TABLE
Use:

PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE

Relationship:
customers
    |
    | customer_id
    |
accounts

One customer can have multiple accounts.

File 2 — 02_insert_data.sql

Insert at least 5 customers and 7 accounts.

Example data:

Customer 1 → John → 2 accounts
Customer 2 → David → 1 account
Customer 3 → Sarah → 2 accounts
Customer 4 → Robert → 1 account
Customer 5 → Alice → 1 account

Use different account types:

SAVINGS
CURRENT
SALARY

and different balances.

Hint

Use:

INSERT INTO customers ...
INSERT INTO accounts ...
COMMIT;

After inserting, verify:
SELECT * FROM customers;
SELECT * FROM accounts;

File 3 — 03_create_procedure.sql
Create a procedure:

transfer_money

The procedure should transfer money from one account to another.

Input parameters
p_from_account
p_to_account
p_amount

For example:

Account 101 → Account 102
Amount → 1000

The procedure should:

Check whether the source account exists.
Check whether the destination account exists.
Check whether the source account has enough balance.
Deduct money from source account.
Add money to destination account.
Commit the transaction.
Display a success message.
Hint

Use:

CREATE OR REPLACE PROCEDURE

You can use:

SELECT ... INTO ...

for checking balances.

For error handling:

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ...
    WHEN OTHERS THEN
        ...

You can use:

RAISE_APPLICATION_ERROR

for custom errors.

Example:

RAISE_APPLICATION_ERROR(
    -20001,
    'Insufficient balance'
);
Testing

After creating the procedure, test it:

BEGIN
    transfer_money(101, 102, 1000);
END;
/

Then:

SELECT * FROM accounts;
File 4 — 04_create_function.sql

Create a function:

get_account_balance

It should accept:

account_id

and return the account balance.

Example:

SELECT get_account_balance(101)
FROM dual;

Expected result:

45000
Hint

Use:

CREATE OR REPLACE FUNCTION

with:

RETURN NUMBER

Inside the function:

SELECT balance
INTO v_balance
FROM accounts
WHERE account_id = p_account_id;

Handle the situation where the account doesn't exist.

File 5 — run.sh

Now create a Linux shell script that executes all four SQL files in the correct order.

The order must be:

01_create_tables.sql
        ↓
02_insert_data.sql
        ↓
03_create_procedure.sql
        ↓
04_create_function.sql
Hint

If you are using Oracle SQL*Plus, the basic idea is:

#!/bin/bash

sqlplus username/password@database <<EOF

@sql/01_create_tables.sql
@sql/02_insert_data.sql
@sql/03_create_procedure.sql
@sql/04_create_function.sql

EXIT;
EOF

You can make the script executable using:

chmod +x run.sh

Then execute:

./run.sh
Additional PL/SQL requirement

Your procedure should contain proper exception handling.

For example, handle:

Account does not exist
Insufficient balance
Invalid amount
Unexpected database error
Hint

Think about:

NO_DATA_FOUND

and:

WHEN OTHERS

You can also create your own application errors.

Testing requirement

After running:

./run.sh

test the function:

SELECT get_account_balance(101)
FROM dual;

Test the procedure:

BEGIN
    transfer_money(101, 102, 500);
END;
/

Then verify:

SELECT account_id, balance
FROM accounts
ORDER BY account_id;

Also test an invalid transfer:

BEGIN
    transfer_money(101, 102, 999999999);
END;
/

It should produce an insufficient balance error rather than allowing the transaction.

GitHub requirement

After successfully testing everything, create a Git repository:

git init

Add your files:

git add .

Commit:

git commit -m "Added banking account PL SQL module"

Connect your GitHub repository:

git remote add origin <your-github-repository>

Push:

git branch -M main
git push -u origin main

Important

Your GitHub repository should contain:

banking-db/
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   ├── 03_create_procedure.sql
│   └── 04_create_function.sql
│
├── run.sh
└── README.md