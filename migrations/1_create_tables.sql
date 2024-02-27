
-- depends:
CREATE TABLE IF NOT EXISTS Type_Of_Workouts(
    id_work SERIAL PRIMARY KEY,
    type varchar(50) unique
);

CREATE TABLE IF NOT EXISTS Halls (
    hall_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    capacity_max INT,
    capacity_now int
    -- Другие данные о зале
);

CREATE TABLE IF NOT EXISTS Instructors (
instructor_id SERIAL PRIMARY KEY,
name VARCHAR(50),
speciality VARCHAR(50) references Type_Of_Workouts(type),
hire_date DATE
);

CREATE TABLE IF NOT EXISTS Clients (
    client_id  SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
    -- Другие данные по клиенту
);


CREATE TABLE  IF NOT EXISTS Subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    client_id INT,
    subscription_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

CREATE TABLE IF NOT EXISTS Workouts (
    workout_id SERIAL PRIMARY KEY,

    client_id INT,
    date DATE,
    time TIME,
    instructor_id INT,
    hall_id int,
    foreign key (instructor_id) references Instructors(instructor_id) ON DELETE CASCADE,
    foreign key (hall_id) references Halls(hall_id) on delete cascade,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    type_workout int  references Type_of_workouts(id_work) ON DELETE CASCADE
    -- Добавьте нужные внешние ключи для инструкторов, если применимо
);













