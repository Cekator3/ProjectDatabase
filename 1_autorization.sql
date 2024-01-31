-- Роль пользователя (суперадмин, админ, печатальщик и заказчик)
DROP TYPE IF EXISTS UserRole CASCADE;
CREATE TYPE UserRole AS ENUM
(
    'customer',
    'printMaster',
    'admin',
    'superuser'
);

-- Пользователь: суперпользователь, админ, печатальщик и заказчик
DROP TABLE IF EXISTS "User" CASCADE;
CREATE TABLE "User"
(
    id              integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    role            UserRole    NOT NULL,
    login           text        NOT NULL UNIQUE,
    password        text        NOT NULL
);

-- Столбцы, относящиеся только к заказчику
DROP TABLE IF EXISTS Customer CASCADE;
CREATE TABLE Customer
(
    userId          integer     NOT NULL UNIQUE,
    profilePicture  text        NOT NULL,
    email           text        NOT NULL UNIQUE,
    phoneNumber     text        NOT NULL UNIQUE,
    name            text,
    surname         text        NOT NULL,
    patronymic      text,

    Foreign Key(userId) REFERENCES "User" (id) ON DELETE CASCADE
);