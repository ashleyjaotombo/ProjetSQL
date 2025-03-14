USE Clinique;

-- Pour la table PATIENT
alter table Patient add constraint Num_secu check (Numero_De_Securite_Sociale BETWEEN 100000000000000 AND 299999999999999);
alter table Patient add constraint cle_prim1 PRIMARY KEY(Numero_De_Securite_Sociale);


-- Pour la table ÉTABLISSEMENT
alter table Etablissement add constraint CP check (Code_Postal BETWEEN 0 AND 99999);
alter table Etablissement add constraint cle_prim2 PRIMARY KEY(ID_Etablissement);


-- Pour la table PERSONNEL
alter table Personnel add constraint cle_prim3 PRIMARY KEY(ID_Personnel);

 
-- Pour la table AMÉNAGEMENT
alter table Amenagement add constraint cle_prim4 PRIMARY KEY(Nom_Amenagement, Nom_Etablissement, Nom_Batiment);
alter table Amenagement add constraint cle_etr4 FOREIGN KEY(ID_Personnel) REFERENCES Personnel(ID_Personnel) ON DELETE CASCADE;
alter table Amenagement add constraint nb_etage4 CHECK (Etage BETWEEN 0 AND 20);  


-- Pour la table TEST
alter table Test add constraint cle_prim5 PRIMARY KEY(Numero_De_Securite_Sociale, Nom_du_test);
alter table Test add constraint cle_etr5 FOREIGN KEY(Numero_De_Securite_Sociale) REFERENCES Patient(Numero_De_Securite_Sociale) ON DELETE CASCADE;
alter table Test add constraint cle_etr5_1 FOREIGN KEY(ID_Etablissement) REFERENCES Etablissement(ID_Etablissement) ON DELETE CASCADE;


-- Pour la table VISITE
alter table Visite add constraint cle_prim6 PRIMARY KEY(Numero_De_Securite_Sociale, ID_Etablissement, Date_D_Admission);
alter table Visite add constraint cle_etr6  FOREIGN KEY(Numero_De_Securite_Sociale) REFERENCES Patient(Numero_De_Securite_Sociale) ON DELETE CASCADE;
alter table Visite add constraint cle_etr6_1  FOREIGN KEY(ID_Etablissement) REFERENCES Etablissement(ID_Etablissement) ON DELETE CASCADE;
alter table Visite add constraint date_6 CHECK (Date_D_Admission <= Date_De_Sortie);



-- Pour la table TRAITE
alter table Traite add constraint cle_prim7 PRIMARY KEY (Numero_De_Securite_Sociale, ID_Personnel);
alter table Traite add constraint cle_etr7  FOREIGN KEY(Numero_De_Securite_Sociale) REFERENCES Patient(Numero_De_Securite_Sociale) ON DELETE CASCADE;
alter table Traite add constraint cle_etr7_1 FOREIGN KEY(ID_Personnel) REFERENCES Personnel(ID_Personnel) ON DELETE CASCADE;



-- Pour la table POSSEDE
alter table Possede add constraint cle_prim8 PRIMARY KEY(ID_Etablissement, Nom_Amenagement, Nom_Batiment, Nom_Etablissement);
alter table Possede add constraint cle_etr8 FOREIGN KEY(ID_Etablissement) REFERENCES Etablissement(ID_Etablissement) ON DELETE CASCADE;
alter table Possede add constraint cle_etr8_1 FOREIGN KEY(Nom_Amenagement, Nom_Etablissement, Nom_Batiment) 
      REFERENCES Amenagement(Nom_Amenagement, Nom_Etablissement, Nom_Batiment) ON DELETE CASCADE;


-- Pour la table NECESSITE
alter table Necessite add constraint cle_prim9 PRIMARY KEY(Numero_De_Securite_Sociale, Nom_Amenagement, Nom_Batiment);
alter table Necessite add constraint cle_etr9 FOREIGN KEY(Numero_De_Securite_Sociale) REFERENCES Patient(Numero_De_Securite_Sociale) ON DELETE CASCADE;
alter table Necessite add constraint cle_etr9_1 FOREIGN KEY(Nom_Amenagement, Nom_Etablissement, Nom_Batiment) 
      REFERENCES Amenagement(Nom_Amenagement, Nom_Etablissement, Nom_Batiment) ON DELETE CASCADE;
      

