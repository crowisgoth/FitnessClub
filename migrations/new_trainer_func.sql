--
-- depends:



CREATE or replace function new_trainer_func() RETURNS TRIGGER AS $$
    BEGIN

        insert  into  type_of_workouts(type) values (new.speciality) ON CONFLICT (type) DO NOTHING;

    RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

create trigger new_trainer
     before insert on instructors
    FOR EACH ROW
    EXECUTE FUNCTION new_trainer_func();





