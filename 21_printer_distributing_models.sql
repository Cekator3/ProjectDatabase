-- распределяемые по принтерам модельки
DROP TABLE IF EXISTS printer_distributing_models;
CREATE TABLE printer_distributing_models
(
    id                  integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id             integer     NOT NULL,
    ordered_model_id    integer     NOT NULL,

    UNIQUE (user_id, ordered_model_id),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (ordered_model_id) REFERENCES ordered_models (id) ON DELETE CASCADE
);