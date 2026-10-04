INSERT INTO customers 
    (customer_id, customer_name, email, phone, created_date) 
VALUES
    (1, 'John Smith', 'john.smith@gmail.com','9876543210','2026-01-10'),
    (2, 'David Miller', 'david.miller@gmail.com','9876543211','2026-02-15'),
    (3,'Sarah Wilson','sarah.wilson@gmail.com','9876543212','2026-03-20'),
    (4, 'Robert Brown','robert.brown@gmail.com','9876543213','2026-04-05'),
    (5,'Alice Johnson','alice.johnson@gmail.com','9876543214','2026-05-12');





INSERT INTO accounts
    (account_id, customer_id, account_type, balance, status)
VALUES
    (101, 1, 'SAVINGS', 50000, 'ACTIVE'),
    (102, 1, 'CURRENT', 30000, 'ACTIVE'),
    (103, 2, 'SAVINGS', 45000, 'ACTIVE'),
    (104, 3, 'SALARY',  60000, 'ACTIVE'),
    (105, 3, 'SAVINGS', 25000, 'ACTIVE'),
    (106, 4, 'CURRENT', 75000, 'ACTIVE'),
    (107, 5, 'SAVINGS', 35000, 'ACTIVE');