-- 
-- depends:
CREATE or replace function delete_trainer_func() RETURNS TRIGGER AS $$
    BEGIN
    IF not EXISTS(SELECT 1 FROM instructors
          WHERE speciality = old.speciality
            )  then
delete from type_of_workouts where type = old.speciality;
end if;
    RETURN old;
    END
$$ LANGUAGE plpgsql;

create trigger delete_trainer
     after delete on instructors
    FOR EACH ROW
    EXECUTE FUNCTION delete_trainer_func();


