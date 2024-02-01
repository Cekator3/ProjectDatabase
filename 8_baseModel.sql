-- Базовая моделька
DROP TABLE IF EXISTS base_models CASCADE;
CREATE TABLE base_models
(
    id                  integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name                text        NOT NULL UNIQUE,
    description         text        NOT NULL,
    preview_image       text        NOT NULL,
    file_3D_preview     text        NOT NULL,
    file_model          text        NOT NULL
);

-- Размер базовой модельки
DROP TABlE IF EXISTS base_model_sizes CASCADE;
CREATE TABLE base_model_sizes
(
    id                  integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    base_model_id       integer     NOT NULL,
    size_multiplier     real        NOT NULL,
    length              integer     NOT NULL,
    width               integer     NOT NULL,
    height              integer     NOT NULL,

    UNIQUE (base_model_id, size_multiplier),
    UNIQUE (base_model_id, length, width, height),
    FOREIGN KEY (base_model_id) REFERENCES base_models (id) ON DELETE CASCADE
);

-- Поисковый тег базовой модельки
DROP TABLE IF EXISTS base_model_search_tags CASCADE;
CREATE TABLE base_model_search_tags
(
    id                  integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    base_model_id       integer     NOT NULL,
    name                text        NOT NULL,

    UNIQUE (base_model_id, name),
    FOREIGN KEY (base_model_id) REFERENCES base_models (id) ON DELETE CASCADE
);