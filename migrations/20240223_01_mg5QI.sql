--
-- depends: 20240222_01_3h4wi

CREATE OR REPLACE FUNCTION increment_capacity()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT capacity_now FROM Halls WHERE hall_id = NEW.hall_id) < (SELECT capacity_max FROM Halls WHERE hall_id = NEW.hall_id) THEN
        UPDATE Halls
        SET capacity_now = capacity_now + 1
        WHERE hall_id = NEW.hall_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER increment_capacity_trigger
AFTER INSERT ON Workouts
FOR EACH ROW
EXECUTE FUNCTION increment_capacity();