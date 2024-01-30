-- Тип филамента
DROP TABLE IF EXISTS FilamentType CASCADE;
CREATE TABLE FilamentType
(
    id                  smallint    GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name                text        NOT NULL UNIQUE,
    description         text        NOT NULL,
    strength            smallint    NOT NULL,
    hardness            smallint    NOT NULL,
    impactResistance    smallint    NOT NULL,
    durability          smallint    NOT NULL,
    minTemperature      smallint    NOT NULL,
    maxTemperature      smallint    NOT NULL,
    foodContact         boolean     NOT NULL
);

-- Технология печати, в которой используется конкретный тип филамента.
DROP TABLE IF EXISTS PrintingTechnologyOfFilamentType CASCADE;
CREATE TABLE PrintingTechnologyOfFilamentType
(
    filamentTypeId          smallint    NOT NULL,
    printingTechnologyId    smallint    NOT NULL,

    UNIQUE (filamentTypeId, printingTechnologyId),
    FOREIGN KEY (filamentTypeId) REFERENCES FilamentType (id),
    FOREIGN KEY (printingTechnologyId) REFERENCES PrintingTechnology (id)
);