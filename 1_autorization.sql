-- Роль пользователя (суперадмин, админ, печатальщик и заказчик)
DROP TYPE IF EXISTS user_role CASCADE;
CREATE TYPE user_role AS ENUM
(
    'customer',
    'print_master',
    'admin',
    'superuser'
);

-- Пользователь: суперпользователь, админ, печатальщик и заказчик
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users
(
    id              integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    role            user_role   NOT NULL,
    login           text        NOT NULL UNIQUE,
    password        text        NOT NULL,
    phone_number    text
);

-- Столбцы, относящиеся только к заказчику
DROP TABLE IF EXISTS customers CASCADE;
CREATE TABLE customers
(
    user_id          integer     NOT NULL UNIQUE,
    profile_picture  text        NOT NULL,
    email            text        NOT NULL UNIQUE,
    name             text        NOT NULL,
    surname          text,
    patronymic       text,

    Foreign Key(user_id) REFERENCES users (id) ON DELETE CASCADE
);