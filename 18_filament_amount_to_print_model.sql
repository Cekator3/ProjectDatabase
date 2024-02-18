DROP TABLE IF EXISTS filaments_amounts_to_print_models;
CREATE TABLE filaments_amounts_to_print_models
(
    id                  bigint      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    filament_type_id    smallint    NOT NULL,
    prepared_model_id   bigint      NOT NULL,
    amount              integer     NOT NULL,

    UNIQUE (filament_type_id, prepared_model_id),
    FOREIGN KEY (filament_type_id) REFERENCES filament_types (id) ON DELETE CASCADE,
    FOREIGN KEY (prepared_model_id) REFERENCES prepared_models (id) ON DELETE CASCADE
);