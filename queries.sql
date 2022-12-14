SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT name FROM animals WHERE neutered = true;
SELECT name FROM animals WHERE NOT name = 'Gabumon';
SELECT name FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Set the species column to unspecified
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

-- Set the species column to digimon for all animals that have a name ending in mon.
-- Set the species column to pokemon for all animals that don't have species already set.
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT species FROM animals;

-- Delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Delete all animals born after Jan 1st, 2022.
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT saved;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO saved;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT weight_kg FROM animals;

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2001-01-01' GROUP BY species;

-- What animals belong to Melody Pond?
SELECT name
FROM animals
JOIN owners ON animals.owners_id = owners.id
WHERE full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species_id = 1;

-- List of all owners and their animals, including those that don't own any animal.
SELECT name, full_name
FROM animals
RIGHT JOIN owners ON animals.owners_id = owners.id;

-- How many animals are there per species?
SELECT species.name, COUNT( * )
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.id

-- List all Digimon owned by Jennifer Orwell.
SELECT name
FROM animals
JOIN owners ON animals.owners_id = owners.id
WHERE full_name = 'Jennifer Orwell'
AND species_id = 2;

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT *
FROM animals
JOIN owners ON animals.owners_id = owners.id
WHERE full_name = 'Dean Winchester' AND escape_attempts = 0;

-- Who owns the most animals?
SELECT COUNT(*) AS owners_count, owners.full_name
FROM animals
JOIN owners ON owners.id = animals.owners_id
GROUP BY owners.full_name
ORDER BY owners_count DESC
LIMIT 1;