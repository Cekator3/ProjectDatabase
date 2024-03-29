-- Подготовленная моделька
DROP TABLE IF EXISTS prepared_models CASCADE;
CREATE TABLE prepared_models
(
    id                                  bigint  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    unprepared_model_id                 bigint  NOT NULL,
    unprepared_composite_model_part_id  bigint,
    preview_image                       text    NOT NULL,
    length                              integer NOT NULL,
    width                               integer NOT NULL,
    height                              integer NOT NULL,

    UNIQUE (unprepared_model_id, unprepared_composite_model_part_id),
    FOREIGN KEY (unprepared_model_id) REFERENCES unprepared_models (id) ON DELETE CASCADE,
    FOREIGN KEY (unprepared_composite_model_part_id) REFERENCES unprepared_composite_model_parts (id) ON DELETE CASCADE
);

-- Файл подготовленной модельки
DROP TABLE IF EXISTS prepared_model_files CASCADE;
CREATE TABLE prepared_model_files
(
    id                  bigint      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    prepared_model_id   bigint      NOT NULL,
    -- Заполненность (solid, holed) - у модельки не меняется внешний вид или размеры
    -- от заполненности. Поэтому is_holed лучше хранить здесь
    is_holed            boolean     NOT NULL,
    file_format         text        NOT NULL,
    file                text        NOT NULL,

    UNIQUE (prepared_model_id, is_holed, file_format),
    FOREIGN KEY (prepared_model_id) REFERENCES prepared_models (id) ON DELETE CASCADE
);