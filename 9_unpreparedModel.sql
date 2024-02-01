-- Неподготовленная моделька
DROP TABLE IF EXISTS unprepared_models;
CREATE TABLE unprepared_models
(
    id                  bigint      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    base_model_id       integer     NOT NULL,
    base_model_size_id  integer     NOT NULL,
    preview_image       text        NOT NULL,
    length              integer     NOT NULL,
    width               integer     NOT NULL,
    height              integer     NOT NULL,
    -- Будут повторяться только столбцы baseModelId и BaseModelSizeId
    is_parted            boolean     NOT NULL,

    FOREIGN KEY (base_model_id) REFERENCES base_models (id) ON DELETE CASCADE,
    FOREIGN KEY (base_model_size_id) REFERENCES base_model_sizes (id) ON DELETE RESTRICT
);
