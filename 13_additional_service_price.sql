-- Цена доп услуг модельки
DROP TABLE IF EXISTS additional_service_prices CASCADE;
CREATE TABLE additional_service_prices
(
    id                      integer         GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    base_model_id           integer         NOT NULL,
    additional_service_id   smallint        NOT NULL,
    printing_technology_id  smallint        NOT NULL,
    filament_type_id        smallint        NOT NULL,
    base_model_size_id      integer         NOT NULL,
    is_parted               boolean         NOT NULL,
    price                   numeric(10, 2)  NOT NULL,

    UNIQUE (base_model_id, additional_service_id, printing_technology_id, filament_type_id, base_model_size_id, is_parted),
    FOREIGN KEY (base_model_id) REFERENCES base_models ON DELETE CASCADE,
    FOREIGN KEY (additional_service_id) REFERENCES additional_services ON DELETE CASCADE,
    FOREIGN KEY (printing_technology_id) REFERENCES printing_technologies ON DELETE CASCADE,
    FOREIGN KEY (filament_type_id) REFERENCES filament_types ON DELETE CASCADE,
    FOREIGN KEY (base_model_size_id) REFERENCES base_model_sizes ON DELETE CASCADE
);