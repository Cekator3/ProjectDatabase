-- Статус печати заказанной модельки
DROP TYPE IF EXISTS ordered_model_completion_status CASCADE;
CREATE TYPE ordered_model_completion_status AS ENUM
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
    -- Если заказчик закаже несколько одинаковых моделек,
    -- то поля у них будут одинаковы, кроме completion_status.
    completion_status       ordered_model_completion_status     NOT NULL,

    FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE,
    FOREIGN KEY (base_model_id) REFERENCES base_models (id) ON DELETE RESTRICT,
    FOREIGN KEY (base_model_size_id) REFERENCES base_model_sizes (id) ON DELETE RESTRICT,
    FOREIGN KEY (printing_technology_id) REFERENCES printing_technologies (id) ON DELETE RESTRICT,
    FOREIGN KEY (filament_type_id) REFERENCES filament_types (id) ON DELETE RESTRICT,
    FOREIGN KEY (color_id) REFERENCES colors (id) ON DELETE RESTRICT
);