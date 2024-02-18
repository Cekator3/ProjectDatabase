-- Доп услуга заказанной модельки
DROP TABLE IF EXISTS additional_services_of_ordered_model CASCADE;
CREATE TABLE additional_services_of_ordered_model
(
    id                      integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ordered_model_id        integer     NOT NULL,
    additional_service_id   integer     NOT NULL,
    -- Пользователь, добавивший доп услугу
    user_id                 integer     NOT NULL,

    UNIQUE (ordered_model_id, additional_service_id),
    FOREIGN KEY (ordered_model_id) REFERENCES ordered_models (id) ON DELETE CASCADE,
    FOREIGN KEY (additional_service_id) REFERENCES additional_services (id) ON DELETE RESTRICT,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
