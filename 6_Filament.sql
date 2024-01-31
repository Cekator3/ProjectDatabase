-- Цвет
DROP TABLE IF EXISTS Color CASCADE;
CREATE TABLE Color
(
    id              smallint    GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name            text        NOT NULL UNIQUE,
    code            text        NOT NULL UNIQUE
);

-- Филамент
DROP TABLE IF EXISTS Filament CASCADE;
CREATE TABLE Filament
(
    id              integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name            text        NOT NULL UNIQUE,
    filamentTypeId  smallint    NOT NULL,
    colorId         smallint    NOT NULL,
    amountReserved  integer     NOT NULL,
    amountFreeToUse integer     NOT NULL,

    FOREIGN KEY (colorId) REFERENCES Color (id) ON DELETE RESTRICT,
    FOREIGN KEY (filamentTypeId) REFERENCES FilamentType (id) ON DELETE CASCADE
);

-- Характеристики печати филамента.
-- Если принтер ей не соотвествует, то, по идее, он не может печатать этим филаментом.
DROP TABLE IF EXISTS FilamentPrintingCharacteristic CASCADE;
CREATE TABLE FilamentPrintingCharacteristic
(
    printingCharacteristicId    integer     NOT NULL,
    filamentId                  integer     NOT NULL,
    value                       integer     NOT NULL,

    UNIQUE (printingCharacteristicId, filamentId),
    FOREIGN KEY (printingCharacteristicId) REFERENCES PrintingCharacteristic (id) ON DELETE CASCADE,
    FOREIGN KEY (filamentId) REFERENCES Filament (id) ON DELETE CASCADE
);