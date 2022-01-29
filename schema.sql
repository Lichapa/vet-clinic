/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT,
    name varchar(40),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(4,2),
    PRIMARY KEY(id)
);

ALTER TABLE animalS ADD COLUMN species VARCHAR(40);