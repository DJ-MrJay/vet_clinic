CREATE TABLE animals (
  id int,
  name varchar(100),
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal,
);

ALTER TABLE animals
ADD COLUMN species varchar(50);

CREATE TABLE owners (
  id int SERIAL PRIMARY KEY,
  full_name varchar(100),
  age int
);

CREATE TABLE species (
  id int SERIAL PRIMARY KEY,
  name varchar(100)
);

ALTER TABLE animals
DROP COLUMN id;

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN id SERIAL PRIMARY KEY;

ALTER TABLE animals
ADD COLUMN species_ID int;

ALTER TABLE animals
ADD FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owners_id int;

ALTER TABLE animals
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);



