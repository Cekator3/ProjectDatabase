-- Принтер
DROP TABLE IF EXISTS printers CASCADE;
CREATE TABLE printers
(
    id                      integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name                    text        NOT NULL UNIQUE,
    preview_image           text        NOT NULL,
    is_broken               boolean     NOT NULL DEFAULT FALSE,
    max_filament_amount     smallint    NOT NULL,
    height                  integer     NOT NULL,
    width                   integer     NOT NULL,
    length                  integer     NOT NULL
);

-- Характеристика печати принтера
DROP TABLE IF EXISTS printer_printing_characteristics CASCADE;
CREATE TABLE printer_printing_characteristics
(
    id                          integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    printer_id                  integer     NOT NULL,
    printing_characteristic_id  integer     NOT NULL,
    value                       integer     NOT NULL,

    UNIQUE (printer_id, printing_characteristic_id),
    FOREIGN KEY (printer_id) REFERENCES printers (id) ON DELETE CASCADE,
    FOREIGN KEY (printing_characteristic_id) REFERENCES printing_characteristics (id) ON DELETE CASCADE
);

-- Технология печати принтера
DROP TABLE IF EXISTS printer_printing_technologies CASCADE;
CREATE TABLE printer_printing_technologies
(
    id                           integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    printer_id                   integer     NOT NULL,
    printing_technology_id       integer     NOT NULL,

    UNIQUE (printer_id, printing_technology_id),
    FOREIGN KEY (printer_id) REFERENCES printers (id) ON DELETE CASCADE,
    FOREIGN KEY (printing_technology_id) REFERENCES printing_technologies (id) ON DELETE CASCADE
);