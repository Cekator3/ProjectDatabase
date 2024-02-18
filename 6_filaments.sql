-- Цвет
DROP TABLE IF EXISTS colors CASCADE;
CREATE TABLE colors
(
    id              smallint    GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name            text        NOT NULL UNIQUE,
    code            text        NOT NULL UNIQUE
);

-- Филамент
DROP TABLE IF EXISTS filaments CASCADE;
CREATE TABLE filaments
(
    id                  integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name                text        NOT NULL UNIQUE,
    filament_type_id    smallint    NOT NULL,
    colorId             smallint    NOT NULL,
    amount_reserved     integer     NOT NULL,
    amount_total        integer     NOT NULL,

    FOREIGN KEY (colorId) REFERENCES colors (id) ON DELETE RESTRICT,
    FOREIGN KEY (filament_type_id) REFERENCES filament_types (id) ON DELETE CASCADE
);

-- Характеристики печати филамента.
-- Если принтер ей не соотвествует, то, по идее, он не может печатать этим филаментом.
DROP TABLE IF EXISTS filament_printing_characteristics CASCADE;
CREATE TABLE filament_printing_characteristics
(
    id                            integer     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    printing_characteristic_id    integer     NOT NULL,
    filament_id                   integer     NOT NULL,
    value                         integer     NOT NULL,

    UNIQUE (printing_characteristic_id, filament_id),
    FOREIGN KEY (printing_characteristic_id) REFERENCES printing_characteristics (id) ON DELETE CASCADE,
    FOREIGN KEY (filament_id) REFERENCES filaments (id) ON DELETE CASCADE
);