-- Тип ошибки модельки
DROP TYPE IF EXISTS model_mistake_type CASCADE;
CREATE TYPE model_mistake_type AS ENUM
(
    'base_model_mistake',
    'normal_unprepared_model_mistake',
    'composite_unprepared_model_mistake',
    'prepared_model_mistake',
    'unknown_mistake'
);

-- Ошибка модельки
DROP TABLE IF EXISTS model_mistakes CASCADE;
CREATE TABLE model_mistakes
(
    id                                  integer             GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id                             integer,
    image                               text                NOT NULL,
    description                         text                NOT NULL,
    type                                model_mistake_type  NOT NULL,
    created_at                          timestamptz         NOT NULL,

    base_model_id                       integer             NOT NULL,
    unprepared_model_id                 integer,
    unprepared_composite_model_part_id  bigint,
    prepared_model_id                   integer,

    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE SET NULL,
    FOREIGN KEY (base_model_id) REFERENCES base_models (id) ON DELETE CASCADE,
    FOREIGN KEY (unprepared_model_id) REFERENCES unprepared_models (id) ON DELETE CASCADE,
    FOREIGN KEY (unprepared_composite_model_part_id) REFERENCES unprepared_composite_model_parts (id) ON DELETE CASCADE,
    FOREIGN KEY (prepared_model_id) REFERENCES prepared_models (id) ON DELETE CASCADE
)