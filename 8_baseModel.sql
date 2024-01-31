-- Базовая моделька
DROP TABLE IF EXISTS BaseModel CASCADE;
CREATE TABLE BaseModel
(
    id                  integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name                text        NOT NULL UNIQUE,
    description         text        NOT NULL,
    previewImage        text        NOT NULL,
    file3DPreview       text        NOT NULL,
    fileModel           text        NOT NULL
);

-- Размер базовой модельки
DROP TABlE IF EXISTS BaseModelSize CASCADE;
CREATE TABLE BaseModelSize
(
    id                  integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    baseModelId         integer     NOT NULL,
    sizeMultiplier      real        NOT NULL,
    length              integer     NOT NULL,
    width               integer     NOT NULL,
    height              integer     NOT NULL,

    UNIQUE (baseModelId, sizeMultiplier),
    UNIQUE (baseModelId, length, width, height),
    FOREIGN KEY (baseModelId) REFERENCES BaseModel (id) ON DELETE CASCADE
);

-- Поисковый тег базовой модельки
DROP TABLE IF EXISTS BaseModelSearchTag CASCADE;
CREATE TABLE BaseModelSearchTag
(
    id                  integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    baseModelId         integer     NOT NULL,
    name                text        NOT NULL,

    UNIQUE (baseModelId, name),
    FOREIGN KEY (baseModelId) REFERENCES BaseModel (id) ON DELETE CASCADE
);