DROP TYPE IF EXISTS printing_completion_status CASCADE;
CREATE TYPE printing_completion_status AS ENUM
(
    'printing_in_progress',
    'printing_finished',
    'models_post_processing_awaiting'
);

-- Попытка печати принтера
DROP TABLE IF EXISTS printing_attempts CASCADE;
CREATE TABLE printing_attempts
(
    id                      bigint                      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    printer_id              integer                     NOT NULL,
    status                  printing_completion_status  NOT NULL,
    finished_at             timestamp,

    FOREIGN KEY (printer_id) REFERENCES printers (id) ON DELETE CASCADE
);

-- Модельки, назначенные принтеру
DROP TABLE IF EXISTS printing_attempt_models CASCADE;
CREATE TABLE printing_attempt_models
(
    id                      bigint      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    printing_attempt_id     bigint      NOT NULL,
    ordered_model_id        integer     NOT NULL,
    is_printed_successfully boolean,

    UNIQUE (printing_attempt_id, ordered_model_id),
    FOREIGN KEY (printing_attempt_id) REFERENCES printing_attempts (id) ON DELETE CASCADE,
    FOREIGN KEY (ordered_model_id) REFERENCES ordered_models (id) ON DELETE CASCADE
);

-- Филаменты, используемые для попытки печати моделек
DROP TABLE IF EXISTS printing_attempt_filaments CASCADE;
CREATE TABLE printing_attempt_filaments
(
    id                      bigint      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    printing_attempt_id     bigint      NOT NULL,
    filament_id             integer     NOT NULL,

    UNIQUE (printing_attempt_id, filament_id),
    FOREIGN KEY (printing_attempt_id) REFERENCES printing_attempts (id) ON DELETE CASCADE,
    FOREIGN KEY (filament_id) REFERENCES filaments (id) ON DELETE CASCADE
);
