-- Принтер
DROP TABLE IF EXISTS Printer CASCADE;
CREATE TABLE Printer
(
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text NOT NULL UNIQUE,
    previewImage text NOT NULL,
    maxFilamentAmount smallint NOT NULL,
    height integer NOT NULL,
    width integer NOT NULL,
    length integer NOT NULL
);

-- Характеристика печати принтера
DROP TABLE IF EXISTS PrinterPrintingCharacteristic CASCADE;
CREATE TABLE PrinterPrintingCharacteristic
(
    printerId                   integer     NOT NULL,
    printingCharacteristicId    integer     NOT NULL,
    value                       integer     NOT NULL,

    UNIQUE (printerId, printingCharacteristicId),
    FOREIGN KEY (printerId) REFERENCES Printer (id) ON DELETE CASCADE,
    FOREIGN KEY (printingCharacteristicId) REFERENCES PrintingCharacteristic (id) ON DELETE CASCADE
);

-- Технология печати принтера
DROP TABLE IF EXISTS PrinterPrintingTechnology CASCADE;
CREATE TABLE PrinterPrintingTechnology
(
    printerId                   integer     NOT NULL,
    printingTechnologyId        integer     NOT NULL,

    UNIQUE (printerId, printingTechnologyId),
    FOREIGN KEY (printerId) REFERENCES Printer (id) ON DELETE CASCADE,
    FOREIGN KEY (printingTechnologyId) REFERENCES PrintingTechnology (id) ON DELETE CASCADE
);