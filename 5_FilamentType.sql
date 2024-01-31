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
    minWorkTemperature  smallint    NOT NULL,
    maxWorkTemperature  smallint    NOT NULL,
    foodContactAllowed  boolean     NOT NULL
);

-- Технология печати, в которой используется конкретный тип филамента.
DROP TABLE IF EXISTS PrintingTechnologyOfFilamentType CASCADE;
CREATE TABLE PrintingTechnologyOfFilamentType
(
    filamentTypeId          smallint    NOT NULL,
    printingTechnologyId    smallint    NOT NULL,

    UNIQUE (filamentTypeId, printingTechnologyId),
    FOREIGN KEY (filamentTypeId) REFERENCES FilamentType (id) ON DELETE CASCADE,
    FOREIGN KEY (printingTechnologyId) REFERENCES PrintingTechnology (id) ON DELETE CASCADE
);