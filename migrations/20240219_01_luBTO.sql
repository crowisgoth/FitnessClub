-- 
-- depends:
CREATE TABLE IF NOT EXISTS Type_Of_Workouts(
    id_work SERIAL PRIMARY KEY,
    type char(50)
);

CREATE TABLE IF NOT EXISTS Instructors (
instructor_id SERIAL PRIMARY KEY,
name VARCHAR(50),
specialty int references Type_Of_Workouts(id_work),
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
    foreign key (instructor_id) references Instructors(instructor_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    type_workout int unique references Type_of_workouts(id_work)
    -- Добавьте нужные внешние ключи для инструкторов, если применимо
);
CREATE TABLE IF NOT EXISTS Halls (
    hall_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    capacity INT
    -- Другие данные о зале
);

INSERT INTO Type_of_workouts(type)
values ('Легкая атлетика'),
       ('Тяжелая атлетика'),
       ('Йога');

-- Вставка данных в таблицу Clients
INSERT INTO Clients (first_name, last_name)
VALUES ('Иван', 'Иванов'),
       ('Мария', 'Петрова'),
       ('Алексей', 'Сидоров');

-- Вставка данных в таблицу Subscriptions
INSERT INTO Subscriptions (client_id, subscription_type, start_date, end_date)
VALUES (1, 'месячный', '2024-02-01', '2024-02-29'),
       (2, 'годовой', '2024-01-01', '2024-12-31'),
       (3, 'тримесячный', '2024-01-15', '2024-04-15');

INSERT INTO Instructors (name, specialty, hire_date)
VALUES ('Иванов Иван', 1, '2023-05-15'),
       ( 'Петрова Ольга', 2, '2022-09-10'),
       ( 'Сидоров Алексей', 3, '2023-01-20');

-- Вставка данных в таблицу Workouts
INSERT INTO Workouts ( client_id, date, time, instructor_id, type_workout)
VALUES ( 1, '2024-02-20', '10:00:00', 1,1),
       ( 2, '2024-02-21', '16:30:00', 2,2),
       ( 3, '2024-02-22', '18:00:00', 3,3);

-- Вставка данных в таблицу Halls
INSERT INTO Halls (hall_id, name, capacity)
VALUES (1, 'Зал Йоги', 15),
       (2, 'Кардиозал', 30),
       (3, 'Тренажерный зал', 25);









