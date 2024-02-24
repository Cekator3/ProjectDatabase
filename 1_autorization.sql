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
    id              integer                 GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    remember_token  character varying(100),
    login           text                    NOT NULL UNIQUE,
    role            user_role               NOT NULL,
    password        text                    NOT NULL,
    phone_number    text                    UNIQUE,
    email           text                    UNIQUE,
    profile_picture text,
    name            text,
    surname         text,
    patronymic      text
);