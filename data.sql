/* Populate database with sample data. */

INSERT INTO animals VALUES(1001, 'Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals VALUES(1002, 'Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals VALUES(1003, 'Pikachu', '2018-01-07', 1, FALSE, 15.04);
INSERT INTO animals VALUES(1004, 'Devimon', '2017-05-12', 5, TRUE, 11);

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(1005, 'Charmander', '2020-02-08', 0, FALSE, -11);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(1006, 'Plantmon', '2022-11-15', 2, TRUE, -5.7);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(1007, 'Squirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(1008, 'Angemon', '2005-06-12', 1, TRUE, -45);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(1009, 'Boarmon', '2005-06-07', 7, TRUE, 20.4);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(1010, 'Blossom', '1998-10-13', 3, TRUE, 17);


/* Insert the following data into the owners table: */
INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES('Bob', 45);
INSERT INTO owners(full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES('Jodie Whittaker', 38);