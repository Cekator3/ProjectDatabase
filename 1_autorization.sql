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
    login           text        NOT NULL,
    role            user_role   NOT NULL,
    password        text        NOT NULL,
    phone_number    text        UNIQUE,
    profile_picture text,
    email           text        UNIQUE,
    name            text,
    surname         text,
    patronymic      text,

    UNIQUE (login, role)
);