-- Тип ошибки модельки
CREATE TYPE ModelMistakeType AS ENUM
(
    'BaseModelMistake',
    'UnpreparedModelMistake',
    'PreparedModelMistake',
    'UnknownMistake'
);

-- Ошибка модельки
DROP TABLE IF EXISTS ModelMistake CASCADE;
CREATE TABLE ModelMistake
(
    id          integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    userId      integer     NOT NULL,
    image       text        NOT NULL,
    description text        NOT NULL,
    datetime    timestamptz NOT NULL,

    FOREIGN KEY (userId) REFERENCES "User" (id)
)