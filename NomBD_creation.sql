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

