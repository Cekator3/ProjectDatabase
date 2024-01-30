-- Неподготовленная моделька
DROP TABLE IF EXISTS UnpreparedModel;
CREATE TABLE UnpreparedModel
(
    id                  bigint      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    baseModelId         integer     NOT NULL,
    baseModelSizeId     integer     NOT NULL,
    previewImage        text        NOT NULL,
    length              integer     NOT NULL,
    width               integer     NOT NULL,
    height              integer     NOT NULL,
    -- Будут повторяться только столбцы baseModelId и BaseModelSizeId
    isParted            boolean     NOT NULL,

    FOREIGN KEY (baseModelId) REFERENCES BaseModel(id),
    FOREIGN KEY (baseModelSizeId) REFERENCES BaseModelSize(id)
);