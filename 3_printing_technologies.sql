-- Технологии 3д-печати
DROP TABLE IF EXISTS printing_technologies CASCADE;
CREATE TABLE printing_technologies
(
    id              smallint    GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name       text        NOT NULL UNIQUE,
    short_name      text        NOT NULL UNIQUE,
    description     text        NOT NULL
);

-- Преимущества и недостатки технологий 3д-печати
DROP TABLE IF EXISTS printing_technology_advantages_and_disadvantages CASCADE;
CREATE TABLE printing_technology_advantages_and_disadvantages
(
    id              smallint    GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    technology_id   smallint    NOT NULL UNIQUE,
    is_advantage    boolean     NOT NULL,
    description     text        NOT NULL,

    FOREIGN KEY (technology_id) REFERENCES printing_technologies(id) ON DELETE CASCADE
);


DROP TYPE IF EXISTS printing_characteristic_type CASCADE;
CREATE TYPE printing_characteristic_type AS ENUM
(
    'boolean',
    'number'
);

-- Вид характеристики печати.
-- В каждой технологии печати свои характеристики на которые следует обращать внимание
-- при выборе принтера для филамента.
DROP TABLE IF EXISTS printing_characteristics CASCADE;
CREATE TABLE printing_characteristics
(
    id                      integer                         GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    printing_technology_id  smallint                        NOT NULL,
    name                    text                            NOT NULL,
    type                    printing_characteristic_type    NOT NULL,

    FOREIGN KEY (printing_technology_id) REFERENCES printing_technologies (id) ON DELETE CASCADE
);
