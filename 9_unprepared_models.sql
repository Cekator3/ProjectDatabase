-- Обычная неподготовленная моделька
DROP TABLE IF EXISTS unprepared_models CASCADE;
CREATE TABLE unprepared_models
(
    id                  bigint      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name                text        NOT NULL,
    base_model_id       integer     NOT NULL,
    base_model_size_id  integer     NOT NULL,
    preview_image       text        NOT NULL,
    is_parted           boolean     NOT NULL,
    part_number         smallint,
    is_composite        boolean     NOT NULL,
    file_model          text        NOT NULL,

    UNIQUE (base_model_id, base_model_size_id, is_parted, part_number),
    FOREIGN KEY (base_model_id) REFERENCES base_models (id) ON DELETE CASCADE,
    FOREIGN KEY (base_model_size_id) REFERENCES base_model_sizes (id) ON DELETE RESTRICT
);

-- Часть составной неподготовленной модели
DROP TABLE IF EXISTS unprepared_composite_model_parts CASCADE;
CREATE TABLE unprepared_composite_model_parts
(
    id                  bigint      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    unprepared_model_id bigint      NOT NULL,
    name                text        NOT NULL,
    preview_image       text        NOT NULL,
    subpart_number      smallint    NOT NULL,
    file_model          text        NOT NULL,

    UNIQUE (unprepared_model_id, subpart_number),
    FOREIGN KEY (unprepared_model_id) REFERENCES unprepared_models (id) ON DELETE CASCADE
);