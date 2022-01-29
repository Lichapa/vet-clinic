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

/* Modify animals table */

-- alter animals id column to auto increment 

CREATE SEQUENCE IF NOT EXISTS animals_id_seq;

SELECT SETVAL('animals_id_seq', (
  SELECT max(id) FROM animals)
);

ALTER TABLE animals
ALTER COLUMN id
SET DEFAULT nextval('animals_id_seq'::regclass);

ALTER SEQUENCE animals_id_seq
OWNED BY animals.id;

-- Remove column species
ALTER TABLE animalS DROP COLUMN species;

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD owners_id INTEGER REFERENCES owners(id);

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
ADD species_id INTEGER REFERENCES species(id);