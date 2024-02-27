--
-- depends: 3_views

create procedure new_user_proc()
    language plpgsql as $$
    begin
        insert into subscriptions(client_id,subscription_type,start_date,end_date) values
            ((SELECT clients.client_id FROM clients ORDER BY clients.client_id desc LIMIT 1),'Дневной',(SELECT CURRENT_DATE),(SELECT CURRENT_DATE + INTERVAL '1 DAY'));

    end;
    $$;

CREATE FUNCTION new_client_func() RETURNS TRIGGER AS $$
    BEGIN
    call new_user_proc();
    RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

create trigger new_client
     after insert on clients
    FOR EACH ROW
    EXECUTE FUNCTION new_client_func();


