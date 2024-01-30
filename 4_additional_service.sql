-- Время выполнения дополнительных услуг
DROP TYPE IF EXISTS AdditionalServiceType CASCADE;
CREATE TYPE AdditionalServiceType AS ENUM
(
    'preprocessing',
    'postprocessing'
);

-- Дополнительные услуги
DROP TABLE IF EXISTS AdditionalService CASCADE;
CREATE TABLE AdditionalService
(
    id                  smallint                GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name                text                    NOT NULL UNIQUE,
    previewImage        text                    NOT NULL,
    description         text                    NOT NULL,
    type                AdditionalServiceType   NOT NULL
);

-- Технологии печати, в которых применяется дополнительная услуга по постобработке
DROP TABLE IF EXISTS PrintingTechnologyOfPostprocessingAdditionalService CASCADE;
CREATE TABLE PrintingTechnologyOfPostprocessingAdditionalService
(
    additionalServiceId  smallint               NOT NULL,
    printingTechnologyId smallint               NOT NULL,

    UNIQUE (additionalServiceId, printingTechnologyId),
    FOREIGN KEY (additionalServiceId) REFERENCES AdditionalService (id),
    FOREIGN KEY (printingTechnologyId) REFERENCES PrintingTechnology (id)
);
