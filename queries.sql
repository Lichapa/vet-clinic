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

/* Write queries (using JOIN) to answer the following questions */

-- What animals belong to Melody Pond?
SELECT full_name, name FROM owners JOIN animals ON owners.id = owners_id WHERE full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT species.name, animals.name FROM species JOIN animals ON species.id = species_id WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name FROM owners LEFT JOIN animals ON owners.id = owners_id;

-- How many animals are there per species?
SELECT species.name, COUNT(species_id) FROM species JOIN animals ON species.id = species_id GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name, species.name AS Species FROM animals JOIN species ON species.id = species_id WHERE owners_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name, full_name FROM animals JOIN owners ON owners_id = owners.id WHERE escape_attempts = 0 AND full_name = 'Dean Winchester';

-- Who owns the most animals?
SELECT full_name, COUNT(owners_id) FROM owners JOIN animals ON owners.id = owners_id 
  GROUP BY full_name HAVING COUNT (owners_id)=(
    SELECT MAX(mycount) FROM (
      SELECT full_name, COUNT(owners_id) 
      AS mycount FROM  animals 
      JOIN owners ON owners_id = owners.id 
      GROUP BY full_name
    ) as Owner
  );