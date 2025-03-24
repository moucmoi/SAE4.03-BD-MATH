-- Insertion des assemblages
INSERT INTO ASSEMBLAGE (id_assemblage, nom) VALUES
(1, 'Vis en titane'),
(2, 'Rivet en aluminium'),
(3, 'Raidisseur composite'),
(4, 'Plaque en alliage'),
(5, 'Panneau de fuselage'),
(6, 'Segment de fuselage'),
(7, 'Aile principale'),
(8, 'Avion complet'),
(9, 'Empennage'),
(10, 'Cockpit');

-- Insertion des composants
INSERT INTO COMPOSANT (nomC, id_composant, prix_unitaire) VALUES
('Vis en titane', 1, 2.50),
('Rivet en aluminium', 2, 0.50),
('Raidisseur composite', 3, 15.00),
('Plaque en alliage', 4, 100.00);

-- Insertion des assemblages composés
INSERT INTO ASSEMBLER (idA, id_isA, quantite) VALUES
(5, 1, 9), (5, 2, 20), (5, 3, 4), (5, 4, 1),
(6, 5, 2), (6, 3, 8), (6, 1, 30),
(7, 4, 3), (7, 1, 50), (7, 2, 100),
(9, 4, 1), (9, 1, 15), (9, 2, 40),
(10, 4, 2), (10, 1, 20), (10, 2, 60),
(8, 6, 3), (8, 7, 2), (8, 9, 1), (8, 10, 1);

-- Insertion des pièces avec infos enrichies
INSERT INTO PIECE VALUES (5, TO_DATE('2025-06-11 13:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2025-06-13 19:00', 'YYYY-MM-DD HH24:MI'), EquipeT(MembreEquipeT('Goscinny', 'Mécanicien'), MembreEquipeT('Uderzo', 'Inspecteur')), ListeQualiteT(IndiceQualiteT('carbone', 3, 4), IndiceQualiteT('securite', 4, 5), IndiceQualiteT('prix', 4, 3)));
INSERT INTO PIECE VALUES (6, TO_DATE('2025-06-14 08:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2025-06-17 16:00', 'YYYY-MM-DD HH24:MI'), EquipeT(MembreEquipeT('Durand', 'Chef d’équipe'), MembreEquipeT('Lemoine', 'Assembleur')), ListeQualiteT(IndiceQualiteT('robustesse', 4, 4), IndiceQualiteT('prix', 3, 2)));
INSERT INTO PIECE VALUES (7, TO_DATE('2025-06-18 09:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2025-06-21 18:00', 'YYYY-MM-DD HH24:MI'), EquipeT(MembreEquipeT('Martin', 'Technicien'), MembreEquipeT('Nguyen', 'Soudeur')), ListeQualiteT(IndiceQualiteT('résistance', 5, 5), IndiceQualiteT('prix', 2, 3)));
INSERT INTO PIECE VALUES (9, TO_DATE('2025-06-22 07:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2025-06-23 17:00', 'YYYY-MM-DD HH24:MI'), EquipeT(MembreEquipeT('Tremblay', 'Inspecteur qualité')), ListeQualiteT(IndiceQualiteT('aérodynamisme', 4, 4), IndiceQualiteT('sécurité', 5, 5)));
INSERT INTO PIECE VALUES (10, TO_DATE('2025-06-24 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2025-06-25 15:00', 'YYYY-MM-DD HH24:MI'), EquipeT(MembreEquipeT('Dupont', 'Assembleur'), MembreEquipeT('Moreau', 'Contrôle')), ListeQualiteT(IndiceQualiteT('ergonomie', 3, 4), IndiceQualiteT('poids', 2, 3)));
INSERT INTO PIECE VALUES (8, TO_DATE('2025-06-26 09:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2025-06-30 17:00', 'YYYY-MM-DD HH24:MI'), EquipeT(MembreEquipeT('Leroy', 'Chef projet'), MembreEquipeT('Bernard', 'Testeur')), ListeQualiteT(IndiceQualiteT('performances', 5, 5), IndiceQualiteT('durabilité', 4, 4), IndiceQualiteT('coût', 3, 2)));

COMMIT;