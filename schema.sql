CREATE TABLE animals (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(100),
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal,
  PRIMARY KEY (id)
);

ALTER TABLE animals
ADD COLUMN species varchar(50);

CREATE TABLE owners (
  id int NOT NULL AUTO_INCREMENT,
  full_name varchar(100),
  age int,
  PRIMARY KEY (id)
);

CREATE TABLE species (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(100),
  PRIMARY KEY (id)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id int REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owners_id int REFERENCES owners(id);
