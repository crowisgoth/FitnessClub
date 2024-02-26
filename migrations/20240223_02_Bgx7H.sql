-- 
-- depends: 20240223_01_mg5QI


CREATE OR REPLACE FUNCTION notification_new_user_func()
RETURNS TRIGGER AS $$
BEGIN
    -- уведомление надо сделать на добавление клиента



END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER notification_new_user
AFTER INSERT ON clients
FOR EACH ROW
EXECUTE FUNCTION increment_capacity();


CREATE OR REPLACE FUNCTION new_trainer_func()
RETURNS TRIGGER AS $$
BEGIN
    -- уведомление на добавление тренера



END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER new_trainer
AFTER INSERT ON Workouts
FOR EACH ROW
EXECUTE FUNCTION increment_capacity();


CREATE OR REPLACE FUNCTION new_subcribe_func()
RETURNS TRIGGER AS $$
BEGIN
    -- уведомление об добавлении абонемента



END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER new_subcribe
AFTER INSERT ON subscriptions
FOR EACH ROW
EXECUTE FUNCTION increment_capacity();