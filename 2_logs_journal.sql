-- Логи приложения
DROP TABLE IF EXISTS application_events CASCADE;
CREATE TABLE application_events
(
    id            bigint      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id       integer,
    created_at    timestamp   NOT NULL DEFAULT now(),
    type          text        NOT NULL,
    description   text        NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE SET NULL
);
