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

/* Owners Table */
CREATE TABLE owners(
   id INT GENERATED ALWAYS AS IDENTITY,
   full_name VARCHAR(60),
   age INT,
   PRIMARY KEY(id)
);

/* Species Table */
CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
     name VARCHAR(40),
     PRIMARY KEY(id)
     );