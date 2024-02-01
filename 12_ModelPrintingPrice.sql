-- Стоимость печати модельки
DROP TABLE IF EXISTS print_model_prices CASCADE;
CREATE TABLE print_model_prices
(
    id                      integer         GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    base_model_id           integer         NOT NULL,
    printing_technology_id  smallint        NOT NULL,
    filament_type_id        smallint        NOT NULL,
    color_id                smallint        NOT NULL,
    base_model_size_id      integer         NOT NULL,
    is_holed                boolean         NOT NULL,
    is_parted               boolean         NOT NULL,
    price                   numeric(10, 2)  NOT NULL,

    UNIQUE (id, base_model_id, printing_technology_id, filament_type_id, color_id, base_model_size_id, is_holed, is_parted),
    FOREIGN KEY (base_model_id) REFERENCES base_models (id) ON DELETE CASCADE,
    FOREIGN KEY (printing_technology_id) REFERENCES printing_technologies (id) ON DELETE CASCADE,
    FOREIGN KEY (filament_type_id) REFERENCES filament_types (id) ON DELETE CASCADE,
    FOREIGN KEY (color_id) REFERENCES colors (id) ON DELETE RESTRICT,
    FOREIGN KEY (base_model_size_id) REFERENCES base_model_sizes (id) ON DELETE CASCADE
);