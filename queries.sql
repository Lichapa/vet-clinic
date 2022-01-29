/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31';
SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT name, date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg = 10.4 AND weight_kg = 17.3;

UPDATE animals SET species = 'unspecified';

/*  Unspecified Rollback */

-- To start the transaction
BEGIN;

-- Updating the table
UPDATE animals SET species = 'unspecified';

-- Checking the Records
SELECT * FROM animals;

-- Rollback to Earlier state
ROLLBACK;

-- Verify the changes have been reverted
SELECT * FROM animals; 


/* Setting Species */
BEGIN; -- Starting Transaction
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon'; 
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

/* Delete all records then Rollback */
BEGIN;
DELETE FROM animals; --Delete all records
SELECT * FROM  animals; -- Verify if records have been deleted
ROLLBACK; -- RollBack
SELECT * FROM  animals; -- Verify if records have been restored


/*BEGIN new Tranction */
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT born2022;
UPDATE animals SET weight_kg = (weight_kg * -1);
ROLLBACK TO born2022;
UPDATE animals SET weight_kg = (weight_kg * -1) WHERE weight_kg < 1;

/* Write queries to answer the following questions */

-- How many animals are there?
  SELECT COUNT(*) FROM animals;
-- How many animals have never tried to escape?
  SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
-- What is the average weight of animals?
  SELECT ROUND(AVG(weight_kg), 2) AS average_weight FROM animals;
-- Who escapes the most, neutered or not neutered animals?
  SELECT MAX(escape_attempts) FROM animals;
  SELECT * FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
-- What is the minimum and maximum weight of each type of animal?
  SELECT species, MAX(weight_kg) AS max_weight, MIN(weight_kg) AS min_Weight FROM animals GROUP BY species;
--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
 SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31' GROUP BY species;
