-- Тип филамента
DROP TABLE IF EXISTS filament_types CASCADE;
CREATE TABLE filament_types
(
    id                      smallint    GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name                    text        NOT NULL UNIQUE,
    description             text        NOT NULL,
    strength                smallint    NOT NULL,
    hardness                smallint    NOT NULL,
    impact_resistance       smallint    NOT NULL,
    durability              smallint    NOT NULL,
    min_work_temperature    smallint    NOT NULL,
    max_work_temperature    smallint    NOT NULL,
    food_contact_allowed    boolean     NOT NULL
);

-- Технология печати, в которой используется конкретный тип филамента.
DROP TABLE IF EXISTS printing_technologies_of_filament_type CASCADE;
CREATE TABLE printing_technologies_of_filament_type
(
    id                        smallint    GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    filament_type_id          smallint    NOT NULL,
    printing_technology_id    smallint    NOT NULL,

    UNIQUE (filament_type_id, printing_technology_id),
    FOREIGN KEY (filament_type_id) REFERENCES filament_types (id) ON DELETE CASCADE,
    FOREIGN KEY (printing_technology_id) REFERENCES printing_technologies (id) ON DELETE CASCADE
);