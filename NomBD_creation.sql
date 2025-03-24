CREATE DATABASE MesCliniques;
USE MesCliniques;

CREATE TABLE Patient(
   Numero_De_Securite_Sociale BIGINT PRIMARY KEY CHECK (Numero_De_Securite_Sociale BETWEEN 100000000000000 AND 299999999999999),
   Mutuelle VARCHAR(50),
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   Adresse VARCHAR(100)
);

CREATE TABLE Etablissement(
   ID_Etablissement INT PRIMARY KEY,
   Nom_Etablissement VARCHAR(50),
   Rue VARCHAR(100),
   Code_Postal INT CHECK (Code_Postal BETWEEN 0 AND 99999)
);

CREATE TABLE Personnel(
   ID_Personnel INT PRIMARY KEY,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   ID_Service INT
);

CREATE TABLE Service_Medical(
   ID_Service BIGINT,
   ID_Etablissement BIGINT NOT NULL,
   Nom_Service VARCHAR(50) NOT NULL,
   PRIMARY KEY(ID_Service, ID_Etablissement)
);

CREATE TABLE Amenagement(
   Nom_Amenagement VARCHAR(50),
   Nom_Etablissement VARCHAR(50),
   Nom_Batiment VARCHAR(50),
   Etage INT CHECK (Etage BETWEEN 0 AND 20),
   ID_Personnel INT NOT NULL,
   PRIMARY KEY(Nom_Amenagement, Nom_Etablissement, Nom_Batiment),
   FOREIGN KEY(ID_Personnel) REFERENCES Personnel(ID_Personnel) ON DELETE CASCADE
);

CREATE TABLE Test(
   Numero_De_Securite_Sociale BIGINT,
   Nom_Du_Test VARCHAR(50),
   Resultat BOOLEAN,
   ID_Etablissement INT NOT NULL,
   PRIMARY KEY(Numero_De_Securite_Sociale, Nom_Du_Test),
   FOREIGN KEY(Numero_De_Securite_Sociale) REFERENCES Patient(Numero_De_Securite_Sociale) ON DELETE CASCADE,
   FOREIGN KEY(ID_Etablissement) REFERENCES Etablissement(ID_Etablissement) ON DELETE CASCADE
);










CREATE DATABASE Hopital;
USE Hopital;

CREATE TABLE Patient(
   Numero_De_Securite_Sociale BIGINT,
   Mutuelle VARCHAR(50),
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   Adresse VARCHAR(100)
);


CREATE TABLE Etablissement(
   ID_Etablissement INT,
   Nom_Etablissement VARCHAR(50),
   Rue VARCHAR(100),
   Code_Postal INT
);


CREATE TABLE Personnel(
   ID_Personnel INT,
   Nom VARCHAR(50),
   Prenom VARCHAR(50)
);


CREATE TABLE Amenagement(
   Nom_Amenagement VARCHAR(50),
   Nom_Etablissement VARCHAR(50),
   Nom_Batiment VARCHAR(50),
   Etage INT,
   ID_Personnel INT NOT NULL
);


CREATE TABLE Test(
   Numero_De_Securite_Sociale BIGINT,
   Nom_Du_Test VARCHAR(50),
   Resultat BOOLEAN,
   ID_Etablissement INT NOT NULL
);


CREATE TABLE Visite(
   Numero_De_Securite_Sociale BIGINT,
   ID_Etablissement INT,
   Date_D_Admission DATE,
   Objet_De_L_Hospitalisation VARCHAR(100),
   Numero_De_Chambre INT,
   Date_De_Sortie DATE
);


CREATE TABLE Traite(
   Numero_De_Securite_Sociale BIGINT,
   ID_personnel INT
);

CREATE TABLE Possede (
   ID_Etablissement INT,
   Nom_Amenagement VARCHAR(50),
   Nom_Batiment VARCHAR(50),
   Nom_Etablissement VARCHAR(50)
);


CREATE TABLE Necessite(
   Numero_De_Securite_Sociale BIGINT,
   Nom_Amenagement VARCHAR(50),
   Nom_Batiment VARCHAR(50),
   Nom_Etablissement VARCHAR(50)
);

