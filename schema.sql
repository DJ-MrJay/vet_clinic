CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name varchar(100),
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal
);

ALTER TABLE animals
ADD COLUMN species varchar(50);

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name varchar(100),
  age int
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name varchar(100)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id int REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owners_id int REFERENCES owners(id);

CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name varchar(100),
  age int,
  date_of_graduation date
);

CREATE TABLE specializations (
  species_id int NOT NULL,
  vet_id int NOT NULL,
  FOREIGN KEY (species_id) REFERENCES species(id),
  FOREIGN KEY (vet_id) REFERENCES vets(id)
);

CREATE TABLE visits (
	animals_id int NOT NULL,
	vet_id int NOT NULL,
	date_of_visit date,
	FOREIGN KEY (animals_id) REFERENCES animals(id),
	FOREIGN KEY (vet_id) REFERENCES vets(id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Adding index on animals_id --
CREATE INDEX _index_animals_visits ON visits(animal_id);
-- Adding index on vet_id --
CREATE INDEX _index_visits_id ON visits(vet_id);

-- Adding Index on email --
CREATE INDEX _index_owner_visits_id ON owners(email);