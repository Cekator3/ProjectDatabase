DROP TABLE IF EXISTS calls_to_customer_history CASCADE;
CREATE TABLE calls_to_customer_history
(
    id              integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id        integer     NOT NULL,
    customer_id     integer     NOT NULL,
    called_at       timestamp   NOT NULL,
    is_success      boolean     NOT NULL,

    UNIQUE (order_id, customer_id, called_at),
    FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES users (id) ON DELETE CASCADE
);