CREATE OR REPLACE PROCEDURE transfer_money(IN  p_from_account INT,IN  p_to_account INT,IN  p_amount INT) 
LANGUAGE plpgsql 
AS $$ 
DECLARE
    source_flag BOOLEAN;
    destination_flag boolean;
    source_balance INTEGER;

BEGIN
    source_flag=false;
    destination_flag =false;
    SELECT EXISTS (
    SELECT 1
    FROM accounts
    WHERE account_id = p_from_account
    )
    INTO source_flag; -- if found true; if not found false

    IF source_flag = FALSE THEN 
        RAISE EXCEPTION 'Source account not found. Provide a valid account number'; 
    END IF;

    SELECT EXISTS (
    SELECT 1
    FROM accounts
    WHERE account_id = p_to_account
    )
    INTO destination_flag; -- if found true; if not found false

    IF destination_flag =false THEN
         raise exception 'Destination account not found. Provide a valid account number';
    END IF;

    -- check source balance >= p_amount
    select balance into source_balance FROM accounts
    WHERE account_id = p_from_account;
    if source_balance<p_amount THEN
        raise exception 'Not sufficient balance';
    end if;

    --- transaction
    update accounts
    set  balance = (source_balance-p_amount)
    WHERE account_id = p_from_account;

    update accounts
    set  balance = ((select balance FROM accounts WHERE account_id = p_to_account)+p_amount)
    WHERE account_id = p_to_account;
   

    RAISE NOTICE 'Transaction successful';

    EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'An error occurred: %', SQLERRM;
        
END;  
$$;