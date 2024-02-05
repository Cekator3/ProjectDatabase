-- Время выполнения дополнительных услуг
DROP TYPE IF EXISTS additional_service_type CASCADE;
CREATE TYPE additional_service_type AS ENUM
(
    'preprocessing',
    'postprocessing'
);

-- Дополнительные услуги
DROP TABLE IF EXISTS additional_services CASCADE;
CREATE TABLE additional_services
(
    id                  smallint                    GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name                text                        NOT NULL UNIQUE,
    type                additional_service_type     NOT NULL,
    preview_image       text                        NOT NULL,
    description         text                        NOT NULL
);

-- Технологии печати, в которых применяется дополнительная услуга по постобработке
DROP TABLE IF EXISTS printing_technologies_of_postprocessing_additional_service CASCADE;
CREATE TABLE printing_technologies_of_postprocessing_additional_service
(
    additional_service_id   smallint               NOT NULL,
    printing_technology_id  smallint               NOT NULL,

    UNIQUE (additional_service_id, printing_technology_id),
    FOREIGN KEY (additional_service_id) REFERENCES additional_services (id) ON DELETE CASCADE,
    FOREIGN KEY (printing_technology_id) REFERENCES printing_technologies (id) ON DELETE CASCADE
);
