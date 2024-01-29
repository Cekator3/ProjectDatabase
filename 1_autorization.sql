-- Роль пользователя (суперадмин, админ, печатальщик и заказчик)
DROP TYPE IF EXISTS UserRole CASCADE;
CREATE TYPE UserRole AS ENUM
(
    'superadmin',
    'admin',
    'printMaster',
    'customer'
);

-- Пользователь: суперпользователь, админ, печатальщик и заказчик
DROP TABLE IF EXISTS "User" CASCADE;
CREATE TABLE "User"
(
    Id integer              PRIMARY KEY,
    Role UserRole           NOT NULL,
    Login text              NOT NULL UNIQUE,
    ProfilePicture text,
    Password text           NOT NULL
);

-- Столбцы, относящиеся только к заказчику
DROP TABLE IF EXISTS Customer CASCADE;
CREATE TABLE Customer
(
    UserId integer,
    Email text                  NOT NULL UNIQUE,
    PhoneNumber text            NOT NULL UNIQUE,
    Name text,
    Surname text                NOT NULL,
    Patronymic text,

    Foreign Key(UserId) REFERENCES "User"(Id)
);

-- Типы логов приложения
DROP TYPE IF EXISTS "ApplicationEventType" CASCADE;
CREATE TYPE "ApplicationEventType" AS ENUM ('создание пользователя', 'удаление пользователя', 'изменение пользователя');

-- Логи приложения
DROP TABLE IF EXISTS "ApplicationEvent" CASCADE;
CREATE TABLE "ApplicationEvent"
(
    "Id" integer,
    "UserId" integer,
    "Datetime" timestamp NOT NULL,
    "Type" "ApplicationEventType" NOT NULL,
    "Description" text NOT NULL,

    PRIMARY KEY ("Id"),
    FOREIGN KEY ("UserId") REFERENCES "User" ("Id")
);


-- Время выполнения дополнительных услуг
DROP TYPE IF EXISTS "AdditionalServiceType" CASCADE;
CREATE TYPE "AdditionalServiceType" AS ENUM ('preprocessing', 'postprocessing');

-- Технологии печати
DROP TYPE IF EXISTS "PrintingTechnologyType" CASCADE;
CREATE TYPE "PrintingTechnologyType" AS ENUM ('FDM', 'SLA', 'DLP', 'LCD', 'SLS');

-- Дополнительные услуги
DROP TABLE IF EXISTS "AdditionalService" CASCADE;
CREATE TABLE "AdditionalService"
(
    "Id" integer,
    "Title" text NOT NULL,
    "PreviewImage" text NOT NULL,
    "Description" text NOT NULL,
    "Type" "AdditionalServiceType" NOT NULL,
    "PrintingTechnology" "PrintingTechnologyType",

    PRIMARY KEY ("Id"),
    UNIQUE ("Title")
);

-- Принтер
DROP TABLE IF EXISTS "Printer" CASCADE;
CREATE TABLE "Printer"
(
    "Id" integer,
    "PreviewImage" text NOT NULL,
    "MaxTemperatureExtruder" smallint,
    "MaxTemperatureTable" smallint,
    MaxAmountOfFilaments smallint,
    Length smallint,
    Width smallint,
    Height smallint,

    PRIMARY KEY ("Id")
);

-- Технологии печати, поддерживаемые принтером
DROP TABLE IF EXISTS "PrintingTechnologyOfPrinter" CASCADE;
CREATE TABLE "PrintingTechnologyOfPrinter"
(
    PrinterId integer,
    Type "PrintingTechnologyType" NOT NULL,

    FOREIGN KEY (PrinterId) REFERENCES Printer ("Id")
);

-- Тип филамента
DROP TABLE IF EXISTS "FilamentType" CASCADE;
CREATE TABLE "FilamentType"
(
    Id integer,
    Title text NOT NULL,
    Description text NOT NULL,


    PRIMARY KEY (Id)
);

-- Технология печати, использующая тип филамента
DROP TABLE IF EXISTS "PrintingTechnologyOfFilamentType" CASCADE;
CREATE TABLE "PrintingTechnologyOfFilamentType"
(
    FilamentId integer,
    Type "PrintingTechnologyType" NOT NULL,

    FOREIGN KEY (FilamentId) REFERENCES Filament ("Id")
);

-- Филамент
DROP TABLE IF EXISTS "Filament" CASCADE;
CREATE TABLE "Filament"
(
    Id integer,

);