-- Технологии 3д-печати\
DROP TABLE IF EXISTS PrintingTechnology CASCADE;
CREATE TABLE PrintingTechnology
(
    id              smallint    GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fullName        text        NOT NULL UNIQUE,
    shortName       text        NOT NULL UNIQUE,
    description     text        NOT NULL
);

-- Преимущества технологий 3д-печати
DROP TABLE IF EXISTS PrintingTechnologyAdvantage CASCADE;
CREATE TABLE PrintingTechnologyAdvantage
(
    id              smallint    GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    technologyId    smallint    NOT NULL UNIQUE,
    description     text        NOT NULL,

    FOREIGN KEY (technologyId) REFERENCES PrintingTechnology(id) ON DELETE CASCADE
);

-- Недостатки технологий 3д-печати
DROP TABLE IF EXISTS PrintingTechnologyDisadvantage CASCADE;
CREATE TABLE PrintingTechnologyDisadvantage
(
    id              smallint    GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    technologyId    smallint    NOT NULL UNIQUE,
    description     text        NOT NULL,

    FOREIGN KEY (technologyId) REFERENCES PrintingTechnology(id) ON DELETE CASCADE
);

DROP TYPE IF EXISTS PrintingCharacteristicType CASCADE;
CREATE TYPE PrintingCharacteristicType AS ENUM
(
    'boolean',
    'number'
);

-- Вид характеристики печати.
-- В каждой технологии печати свои характеристики на которые следует обращать внимание
-- при выборе принтера для филамента.
DROP TABLE IF EXISTS PrintingCharacteristic CASCADE;
CREATE TABLE PrintingCharacteristic
(
    id                      integer                         GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    printingTechnologyId    smallint                        NOT NULL,
    name                    text                            NOT NULL,
    type                    PrintingCharacteristicType      NOT NULL,

    FOREIGN KEY (printingTechnologyId) REFERENCES PrintingTechnology (id) ON DELETE CASCADE
);
