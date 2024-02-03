-- Статус печати заказанной модельки
DROP TYPE IF EXISTS ordered_model_printing_status CASCADE;
CREATE TYPE ordered_model_printing_status AS ENUM
(
    'needs_admin_checking',
    'on_admin_checking',
    'needs_to_be_printed',
    'is_in_printer_queue',
    'is_being_printed',
    'is_on_post_processing',
    'is_on_admin_final_check',
    'completed'
);

-- Заказанная моделька
DROP TABLE iF EXISTS ordered_models CASCADE;
CREATE TABLE ordered_models
(
    id                      integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id             integer     NOT NULL,
    order_id                integer     NOT NULL,
    customer_special_wishes text,

    -- На основе этих данных можно вычислить нужную
    -- подготовленную модельку
    base_model_id           integer     NOT NULL,
    base_model_size_id      smallint    NOT NULL,
    is_parted               boolean     NOT NULL,
    is_holed                boolean     NOT NULL,

    printing_technology_id  smallint    NOT NULL,
    filament_type_id        smallint    NOT NULL,
    color_id                smallint    NOT NULL,

    -- Печать модельки
    printing_status         ordered_model_printing_status NOT NULL,
    printer_id              integer,

    FOREIGN KEY (customer_id) REFERENCES users (id),
    FOREIGN KEY (order_id) REFERENCES orders (id),
    FOREIGN KEY (base_model_id) REFERENCES base_models (id),
    FOREIGN KEY (base_model_size_id) REFERENCES base_model_sizes (id),
    FOREIGN KEY (printing_technology_id) REFERENCES printing_technologies (id),
    FOREIGN KEY (filament_type_id) REFERENCES filament_types (id),
    FOREIGN KEY (color_id) REFERENCES colors (id),
    FOREIGN KEY (printer_id) REFERENCES printers (id)
);

-- Доп услуга заказанной модельки
DROP TABLE IF EXISTS additional_services_of_ordered_model CASCADE;
CREATE TABLE additional_services_of_ordered_model
(
    ordered_model_id integer NOT NULL,
    additional_service_id integer NOT NULL,

    UNIQUE (ordered_model_id, additional_service_id),
    FOREIGN KEY (ordered_model_id) REFERENCES ordered_models (id),
    FOREIGN KEY (additional_service_id) REFERENCES additional_services (id)
);