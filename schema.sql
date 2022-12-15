CREATE TABLE animals (
  id int,
  name varchar(100),
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal,
  species varchar(100)
);

CREATE TABLE owners (
  id int AUTO_INCREMENT PRIMARY KEY,
  full_name varchar(100),
  age int
);

CREATE TABLE species (
  id int AUTO_INCREMENT PRIMARY KEY,
  name varchar(100)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_ID INT REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owners_id INT REFERENCES owners(id);



