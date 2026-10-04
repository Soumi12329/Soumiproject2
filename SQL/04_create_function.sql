create or replace function get_account_balance( acc_id INT)
RETURNS INTEGER 
LANGUAGE plpgsql
AS $$
DECLARE
    acc_balance INTEGER;
BEGIN

    SELECT balance into acc_balance
    FROM accounts
    WHERE account_id = acc_id;

    IF NOT FOUND THEN 
        RAISE EXCEPTION 'Account % not found', acc_id; 
    END IF;

    return acc_balance;

END;
$$;