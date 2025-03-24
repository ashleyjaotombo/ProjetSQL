-- Vérification que toutes les données ont correctement été insérées
select * from Patient;
select * from Etablissement;
select * from Personnel;
select * from Amenagement;
select * from Test;
select * from Visite;
select * from Traite;
select * from Possede;
select * from Necessite;


-- Partie 1 : REQUÊTE DE RESTRICTIon ET DE SÉLECTIon

-- Liste les noms des patients qui ont la mutuelle Groupama
select Nom, Prenom, Mutuelle from Patient where Mutuelle='Groupama';

-- Donne les informations des établissements qui ont le code postal 75000
select ID_Etablissement, Nom_Etablissement, Code_postal from Etablissement where Code_Postal=75000;

-- Liste le nom et prénom du personnel dont le prénom contient un M
select Nom, Prenom from Personnel where Prenom like '%M%';

-- Liste le Nom des établissements qui possèdent un Aménagement dont l'intitulé commence par Salle, et qui se trouve au deuxième étage
select Nom_Etablissement from Amenagement where Nom_Amenagement like 'Salle%' and Etage=2;

-- Liste les Numéros de Sécu Sociale et les informations du test des patients traités dans l'établissement d'ID 3
select Numero_De_Securite_Sociale, Nom_Du_test, Resultat from Test where ID_Etablissement=3;

-- Détermine le Numéro de Sécu Sociale ainsi que lieu d'Hospitalisation des patients atteints de Malaise
select Numero_De_Securite_Sociale, ID_Etablissement, Numero_De_Chambre from Visite where Objet_de_L_Hospitalisation='Malaise';

-- Liste les établissements et le bâtiment où l'on retrouve un Service Réanimation
select Nom_Etablissement, Nom_Batiment from Possede where Nom_Amenagement='Service Réanimation';

-- Liste les ID des patients de l'Hopital Saint-Anotines et les aménagements dont ils ont besoin
select Numero_De_Securite_Sociale, Nom_Amenagement from Necessite where Nom_Etablissement='Hôpital Saint-Antoine';

-- Détermine le nombre de Visite effectué dans l'établissement d'ID 3
select COUNT(Numero_De_Securite_Sociale) as Nombre_De_Visite from Visite where ID_Etablissement=3;

-- Détermine les aménagements de la Clinique du Parc et de la Clinique des Amandiers
select Nom_Amenagement from Amenagement where Nom_Etablissement in ('Clinique du Parc','Clinique des Amandiers');



-- Partie 2 : REQUÊTE DE TRI, D'AGRÉGATIon ET DE GROUPEMENT

-- Liste les noms des patients des mutuelles qui sont triées dans l'ordre décroissant
select Nom, Prenom, Mutuelle from Patient order by Mutuelle desc;

-- Détermine le nombre de clients que possède chaque mutuelle triée dans l'ordre croissant
select COUNT(*)  as 'Nombre de Patient par mutuelle', Mutuelle from Patient GROUP BY Mutuelle order by Mutuelle;

-- Détermine le nombre de cas de patients pour chaque objet d'hospitalisation
select COUNT(Numero_De_Securite_Sociale) as 'Nombre de Cas', Objet_De_L_Hospitalisation from Visite group by Objet_De_L_Hospitalisation;

-- Détermine la proportion des cas positifs selon les différents tests
select AVG(Resultat=TRUE)*100 as 'Proportion de cas positif par Test', Nom_Du_Test as 'Test effectué' from Test group by Nom_Du_Test;

-- Détermine l'effectif du Personnel qui s'occupe de chaque Aménagement pour chaque Etablissement
select COUNT(ID_Personnel) as 'Effectif du personnel' , Nom_Amenagement, Nom_Etablissement 
	from Amenagement GROUP BY Nom_Amenagement, Nom_Etablissement;

-- Identifie les patients traités par le Personnel d'ID 2, et le lieu d'hospitalisation
select Numero_De_Securite_Sociale, Nom_Etablissement, Nom_Batiment from Necessite 
	where Numero_De_Securite_Sociale IN (select Numero_De_Securite_Sociale from Traite where ID_Personnel=2);
    
-- Détermine le nombre de patients qui ne possède pas de mutuelle
select COUNT(*) from Patient where Mutuelle is NULL;

-- Liste les établissements triés par code postal croissant puis par nom d’établissement
select Nom_Etablissement, Code_Postal from Etablissement order by Code_Postal asc, Nom_Etablissement asc;

-- Détermine le nombre de tests effectués par établissement
select ID_Etablissement, COUNT(*) as Nombre_De_Tests from Test
GROUP BY ID_Etablissement;

-- Détermine le nombre moyen de jours d’hospitalisation par établissement
select ID_Etablissement, AVG(DATEDIFF(Date_De_Sortie, Date_D_Admission)) as Moyenne_Jours_Hospitalisation from Visite 
where Date_De_Sortie IS NOT NULL GROUP BY ID_Etablissement;





-- Partie 3 : PRODUIT CARTÉSIEN ET JOINTURE

-- Liste les patients et leurs lieux d'hospitalisation
select Pa.Nom, Pa.Prenom, Vi.Numero_De_Chambre, E.Nom_Etablissement 
	from Patient Pa join Visite Vi using (Numero_De_Securite_Sociale)
    join Etablissement E using (ID_Etablissement);
    
-- Liste le personnel ainsi que l'aménagement et l'établissement où ils travaillent
select Pe.Nom, Pe.Prenom, A.Nom_Amenagement, A.Nom_Etablissement from Personnel Pe join Amenagement A using (ID_Personnel);

-- Liste les patients qui ont été traités à L'Hopital Saint-Louis et le résultat de leur test
select Pa.Nom, Pa.Prenom, T.Nom_Du_Test, T.Resultat, E.Nom_Etablissement from Patient Pa 
	join Test T using (Numero_De_Securite_Sociale) 
    join Etablissement E using (ID_Etablissement) where (E.Nom_Etablissement='Hôpital Saint-Louis');
    
-- Liste les patients hospitalisés dans un établissement situé à Paris et leurs lieux d'hospitalisation
select Pa.Nom, Pa.Prenom, Vi.Numero_De_Chambre, E.Nom_Etablissement  
from Patient Pa  
join Visite Vi using (Numero_De_Securite_Sociale)  
join Etablissement E using (ID_Etablissement)  
where E.Code_Postal = 75000;
-- Liste les patients ayant visité plusieurs établissements

select Pa.Nom as Nom_Patient, Pa.Prenom as Prenom_Patient, COUNT(DISTINCT V.ID_Etablissement) as Nombre_Etablissements
from Patient Pa
join Visite V on Pa.Numero_De_Securite_Sociale = V.Numero_De_Securite_Sociale
GROUP BY Pa.Numero_De_Securite_Sociale
HAVING COUNT(DISTINCT V.ID_Etablissement) > 1;


-- Liste les patients ayant passé un test COVID-19 et l'établissement où ils l'ont fait
select Pa.Nom, Pa.Prenom, T.Nom_Du_Test, T.Resultat, E.Nom_Etablissement  
from Patient Pa  
join Test T using (Numero_De_Securite_Sociale)  
join Etablissement E using (ID_Etablissement)  
where T.Nom_Du_Test = 'Test COVID-19';

-- Liste les patients ayant été hospitalisés pour un malaise et les établissements correspondants
select Pa.Nom, Pa.Prenom, E.Nom_Etablissement, Vi.Numero_De_Chambre from Patient Pa  
join Visite Vi using (Numero_De_Securite_Sociale)  
join Etablissement E using (ID_Etablissement)  
where Vi.Objet_De_L_Hospitalisation = 'Malaise';

--  Liste les patients qui sont toujours hospitalisés
select Pa.Nom as Nom_Patient, Pa.Prenom as Prenom_Patient, V.Date_D_Admission, E.Nom_Etablissement
from Patient Pa
join Visite V on Pa.Numero_De_Securite_Sociale = V.Numero_De_Securite_Sociale
join Etablissement E on V.ID_Etablissement = E.ID_Etablissement
where V.Date_De_Sortie IS NULL;

-- Liste les patients hospitalisés le 01/03/2024
select Pa.Nom as Nom_Patient, Pa.Prenom as Prenom_Patient, V.Date_D_Admission, E.Nom_Etablissement
from Patient Pa join Visite V on Pa.Numero_De_Securite_Sociale = V.Numero_De_Securite_Sociale
join Etablissement E on V.ID_Etablissement = E.ID_Etablissement
where V.Date_D_Admission = '2024-03-01';





