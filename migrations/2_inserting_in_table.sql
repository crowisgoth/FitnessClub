-- 
-- depends: 1_create_tables

    INSERT INTO Type_of_workouts(type)
values ('Кардио тренировка'),
       ('Тяжелая атлетика'),
       ('Йога');

INSERT INTO Clients (first_name, last_name)
VALUES ('Иван', 'Борисов'),
       ('Мария', 'Петрова'),
       ('Алексей', 'Свириденко');



INSERT INTO Halls (name, capacity_max,capacity_now)
VALUES ( 'Зал Йоги', 15,0),
       ( 'Кардиозал', 30,0),
       ( 'Тренажерный зал', 25,0);

INSERT INTO Instructors (name, speciality, hire_date)
VALUES ('Иванов Борисов', 'Йога', '2023-05-15'),
       ( 'Петрова Ольга', 'Кардио тренировка', '2022-09-10'),
       ( 'Сидоров Алексей', 'Тяжелая атлетика', '2023-01-20');

INSERT INTO Workouts ( client_id, date, time, instructor_id,hall_id, type_workout)
VALUES ( 1, '2024-02-20', '10:00:00', 1,1,1),
       ( 2, '2024-02-21', '16:30:00', 2,2,2),
       ( 3, '2024-02-22', '18:00:00', 3,2,3);

INSERT INTO Subscriptions (client_id, subscription_type, start_date, end_date)
VALUES (1, 'месячный', '2024-02-01', '2024-03-01'),
       (2, 'годовой', '2024-01-01', '2025-01-01'),
       (3, 'недельный', '2024-01-15', '2024-04-15');



