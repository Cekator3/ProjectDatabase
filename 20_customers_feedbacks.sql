-- Отзыв заказчика
DROP TABLE IF EXISTS customer_model_feedbacks CASCADE;
CREATE TABLE customer_model_feedbacks
(
    id                  integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id             integer     NOT NULL,
    base_model_id       integer     NOT NULL,
    -- Если указан feedback_id, то это ответ к отзыву или к другому ответу.
    parent_feedback_id  integer,
    -- Только в отзывах можно указывать рейтинг модельки.
    rate                integer,
    created_at          timestamptz NOT NULL,
    content             text        NOT NULL,

    FOREIGN KEY (base_model_id) REFERENCES base_models (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (parent_feedback_id) REFERENCES customer_model_feedbacks(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS model_feedback_photos CASCADE;
CREATE TABLE model_feedback_photos
(
    id              integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    feedback_id     integer     NOT NULL,
    photo           text        NOT NULL,

    UNIQUE (feedback_id, photo),
    FOREIGN KEY (feedback_id) REFERENCES customer_model_feedbacks(id) ON DELETE CASCADE
);