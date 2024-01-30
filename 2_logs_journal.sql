-- Логи приложения
DROP TABLE IF EXISTS ApplicationEvent CASCADE;
CREATE TABLE ApplicationEvent
(
    id            bigint      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    userId        integer     NOT NULL UNIQUE,
    datetime      timestamp   NOT NULL,
    type          text        NOT NULL,
    description   text        NOT NULL,

    FOREIGN KEY (UserId) REFERENCES "User" (id)
);
