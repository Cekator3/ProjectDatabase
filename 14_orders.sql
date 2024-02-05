-- Статус заказа (необходима проверка, ожидает оплаты, на проверке, на выполнении, в доставке, выполнен)
DROP TYPE IF EXISTS order_status CASCADE;
CREATE TYPE order_status AS ENUM
(
    'needs_checking'
    'on_checking',
    'waiting_for_payment',
    'on_execution',
    'on_delivery'
);

-- Способ доставки заказа (самовывоз, доставка курьером, СДЭК, Почта России)
DROP TYPE IF EXISTS order_delivery_method CASCADE;
CREATE TYPE order_delivery_method AS ENUM
(
    'self_delivery',
    'courier_delivery',
    'sdek',
    'russian_post'
);

-- Заказ
DROP TABLE IF EXISTS orders CASCADE;
CREATE TABLE orders
(
    id                      integer         GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id             integer         NOT NULL UNIQUE,
    status                  order_status    NOT NULL,
    payed_at                timestamp       NOT NULL,

    -- данные получателя
    receiver_phone_number   text            NOT NULL,
    receiver_email          text            NOT NULL,
    receiver_name           text            NOT NULL,
    receiver_surname        text,
    receiver_patronymic     text,

    -- адрес доставки
    delivery_method order_delivery_method   NOT NULL,
    delivery_address_city text,
    delivery_address_street text,
    delivery_address_building_number text,
    delivery_address_house_number text,
    delivery_address_apartment_number text,
    delivery_address_postal_code integer,

    FOREIGN KEY (customer_id) REFERENCES users (id) ON DELETE CASCADE
);

-- Успешно заказанные модельки заказчиком (нужен для отзывов)
DROP TABLE IF EXISTS customer_acquired_models CASCADE;
CREATE TABLE customer_acquired_models
(
    customer_id             integer NOT NULL,
    base_model_id           integer NOT NULL,

    UNIQUE (customer_id, base_model_id),
    FOREIGN KEY (customer_id) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (base_model_id) REFERENCES base_models (id) ON DELETE CASCADE
);
