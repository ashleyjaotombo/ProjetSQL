USE Clinique;

INSERT INTO Patient VALUES
(123456789012345, 'MGEN', 'Durand', 'Jean', '12 rue des Lilas, Paris'),
(187654321098765, 'Harmonie Mutuelle', 'Martin', 'Sophie', '45 avenue des Champs, Lyon'),
(256123789456123, 'La Mutuelle Générale', 'Dubois', 'Pierre', '78 boulevard Haussmann, Marseille'),
(127278336363525, 'Groupama', 'Marie', 'Pablo', '16 rue Pascal, Antony'),
(137828732827328, 'Macif', 'Jean', 'Peter', '12 avenue Léon Blum, Paris'),
(238838282883737, 'AG2R La Mondiale', 'Pascal', 'Legrand', '18 rue de la Paix, Paris'),
(178721837788373, 'Maaf', 'Sacha', 'Yvon', '24 avenue du Temple, Lille'),
(171827226266266, 'Solimut', 'Thor', 'Duroc', '15 rue du Marché, Saint-Étienne'),
(123456789012350, 'MGEN', 'Lemoine', 'Lucie', '21 rue de la Liberté, Nantes'),
(187654321098766, 'Harmonie Mutuelle', 'Bernard', 'Paul', '67 avenue des Roses, Toulouse'),
(256123789456124, 'La Mutuelle Générale', 'Leclerc', 'Julien', '52 rue du Maréchal, Bordeaux'),
(127278336363526, 'Groupama', 'Bertin', 'Sophie', '8 rue de la République, Lyon'),
(137828732827329, 'Macif', 'Garnier', 'Michel', '11 rue de la Gare, Lille'),
(238838282883738, 'AG2R La Mondiale', 'Moreau', 'Clara', '30 rue de la Liberté, Marseille'),
(178721837788374, 'Maaf', 'Vidal', 'Amélie', '3 rue des Amandiers, Nice'),
(171827226266267, 'Solimut', 'Gomez', 'Thierry', '5 boulevard de la Paix, Paris');



INSERT INTO Etablissement VALUES
(1, 'Hôpital Saint-Louis', '10 rue de la Villette', 75000),
(2, 'Clinique du Parc', '5 avenue du Parc', 69000),
(3, 'Centre Médical Sud', '22 boulevard du Centre', 13000),
(4, 'Hôpital de la Timone', '19 rue Saint-Jacques', 13000),
(5, 'Clinique des Amandiers', '42 rue des Amandiers', 06000),
(6, 'Hôpital Européen Georges Pompidou', '20 rue de la Convention',75000),
(7, 'Centre Hospitalier Lyon-Sud', '165 avenue du Doyen', 69000),
(8, 'Hôpital Saint-Antoine', '184 rue du Faubourg Saint-Antoine', 75000);


INSERT INTO Personnel VALUES
(1, 'Bernard', 'Luc', 1),
(2, 'Morel', 'Camille', 2),
(3, 'Rousseau', 'Hugo', 3),
(4, 'Dupont', 'Claire', 4),
(5, 'Lemoine', 'Julien', 1),
(6, 'Garnier', 'Michel', 2),
(7, 'Leclerc', 'Sophie', 3),
(8, 'Dufresne', 'Paul', 4);


INSERT INTO Service_Medical VALUES
(1, 1,'Service Cardiologie'),
(2, 2,'Service Urgences'),
(3, 3,'Service Pédiatrie'),
(4, 4,'Service Oncologie'),
(1, 5,'Service Cardiologie'),
(2, 6,'Service Urgences'),
(3, 7,'Service Pédiatrie'),
(4, 8,'Service Oncologie');



INSERT INTO Amenagement VALUES
('Salle d\'opération', 'Hôpital Saint-Louis', 'Bloc A', 2, 1),
('Salle de repos', 'Clinique du Parc', 'Bâtiment Principal', 1, 2),
('Service Urgences', 'Centre Médical Sud', 'Aile Est', 7, 3),
('Salle de Radiologie', 'Hôpital de la Timone', 'Sous-sol', 3, 4),
('Salle de Chirurgie', 'Clinique des Amandiers', 'Niveau 2', 4, 5),
('Service Réanimation', 'Hôpital Européen Georges Pompidou', 'Bâtiment C', 5, 6),
('Salle d\'Accueil', 'Centre Hospitalier Lyon-Sud', 'Rez-de-chaussée', 6, 7),
('Salle d\'Observation', 'Hôpital Saint-Antoine', 'Aile Sud', 7, 8);


INSERT INTO Test VALUES
(123456789012345, 'Test COVID-19', TRUE, 1), 
(187654321098765, 'Test Grippe', FALSE, 2),    
(256123789456123, 'Test Diabète', TRUE, 3),  
(127278336363525, 'Test COVID-19', TRUE, 4),  
(137828732827328, 'Test Cholestérol', FALSE, 5), 
(238838282883737, 'Test VIH', TRUE, 6),        
(178721837788373, 'Test Hépatite', TRUE, 7),    
(171827226266266, 'Test Cancer', FALSE, 8),   
(123456789012350, 'Test Grippe', FALSE, 1),   
(187654321098766, 'Test COVID-19', TRUE, 2),  
(256123789456124, 'Test Diabète', TRUE, 3),
(127278336363526, 'Test VIH', FALSE, 4),      
(137828732827329, 'Test Cholestérol', TRUE, 5),
(238838282883738, 'Test COVID-19', TRUE, 6),  
(178721837788374, 'Test Hépatite', FALSE, 7),  
(171827226266267, 'Test Cancer du foie', TRUE, 8); 



INSERT INTO Visite VALUES
(123456789012345, 1, '2024-03-01', 'Toux fréquente', 101, '2024-03-05'),
(187654321098765, 2, '2024-02-15', 'Forte Grippe', 205, NULL),
(256123789456123, 3, '2024-01-20', 'Malaise', 302, '2024-02-01'),
(127278336363525, 4, '2024-01-10', 'Toux fréquente', 405, '2024-01-15'),
(137828732827328, 5, '2024-02-05', 'Courbatures', 210, '2024-02-20'),
(238838282883737, 6, '2024-03-12', 'Dépistage', 303, '2024-03-25'),
(178721837788373, 7, '2024-03-03', 'Dégradation du foie', 401, NULL),
(171827226266266, 8, '2024-02-20', 'Traitement de l\'asthme', 112, '2024-02-25'),
(123456789012350, 1, '2024-02-01', 'Malaise', 108, '2024-02-10'),
(187654321098766, 2, '2024-03-08', 'Toux fréquentes', 212, '2024-03-18'),
(256123789456124, 3, '2024-01-25', 'Test Diabète', 115, NULL),
(127278336363526, 4, '2024-03-01', 'Dépistage', 210, '2024-03-10'),
(137828732827329, 5, '2024-03-05', 'Courbatures', 303, NULL),
(238838282883738, 6, '2024-03-10', 'Toux fréquentes', 410, NULL),
(178721837788374, 7, '2024-03-05', 'Dégradation du foie', 513, NULL),
(171827226266267, 8, '2024-01-15', 'Douleur abdominale', 330, '2024-02-01');


INSERT INTO Traite VALUES
(123456789012345, 1),
(187654321098765, 2),
(256123789456123, 3),
(127278336363525, 4),
(137828732827328, 5),
(238838282883737, 6),
(178721837788373, 7),
(171827226266266, 8),
(123456789012350, 1),
(187654321098766, 2),
(256123789456124, 3),
(127278336363526, 4),
(137828732827329, 5),
(238838282883738, 6),
(178721837788374, 7),
(171827226266267, 8);

INSERT INTO Possede VALUES
(1, 'Salle d\'opération', 'Bloc A', 'Hôpital Saint-Louis'),
(2, 'Salle de repos', 'Bâtiment Principal', 'Clinique du Parc'),
(3, 'Service Urgences', 'Aile Est', 'Centre Médical Sud'),
(4, 'Salle de Radiologie', 'Sous-sol', 'Hôpital de la Timone'),
(5, 'Salle de Chirurgie', 'Niveau 2', 'Clinique des Amandiers'),
(6, 'Service Réanimation', 'Bâtiment C', 'Hôpital Européen Georges Pompidou'),
(7, 'Salle d\'Accueil', 'Rez-de-chaussée', 'Centre Hospitalier Lyon-Sud'),
(8, 'Salle d\'Observation', 'Aile Sud', 'Hôpital Saint-Antoine');



INSERT INTO Necessite VALUES
(123456789012345, 'Salle d\'Opération', 'Bloc A', 'Hôpital Saint-Louis'),
(187654321098765, 'Salle de Repos', 'Bâtiment Principal', 'Clinique du Parc'),
(256123789456123, 'Service Urgences', 'Aile Est', 'Centre Médical Sud'),
(127278336363525, 'Salle de Radiologie', 'Sous-sol', 'Hôpital de la Timone'),
(137828732827328, 'Salle de Chirurgie', 'Niveau 2', 'Clinique des Amandiers'),
(238838282883737, 'Service Réanimation', 'Bâtiment C', 'Hôpital Européen Georges Pompidou'),
(178721837788373, 'Salle d\'Accueil', 'Rez-de-Chaussée', 'Centre Hospitalier Lyon-Sud'),
(171827226266266, 'Salle d\'Observation', 'Aile Sud', 'Hôpital Saint-Antoine'),
(123456789012350, 'Salle d\'Opération', 'Bloc A', 'Hôpital Saint-Louis'),
(187654321098766, 'Salle de Repos', 'Bâtiment Principal', 'Clinique du Parc'),
(256123789456124, 'Service Urgences', 'Aile Est', 'Centre Médical Sud'),
(127278336363526, 'Salle de Radiologie', 'Sous-sol', 'Hôpital de la Timone'),
(137828732827329, 'Salle de Chirurgie', 'Niveau 2', 'Clinique des Amandiers'),
(238838282883738, 'Service Réanimation', 'Bâtiment C', 'Hôpital Européen Georges Pompidou'),
(178721837788374, 'Salle d\'Accueil', 'Rez-de-Chaussée', 'Centre Hospitalier Lyon-Sud'),
(171827226266267, 'Salle d\'Observation', 'Aile Sud', 'Hôpital Saint-Antoine');


