

-- Inserts ASSEMBLAGE
INSERT INTO ASSEMBLAGE (nom) VALUES
('Vis en titane'),
('Rivet en aluminium'),
('Raidisseur composite'),
('Plaque en alliage'),
('Panneau de fuselage'),
('Segment de fuselage'),
('Aile principale'),
('Avion complet'),
('Empennage'),
('Cockpit');

-- Inserts COMPOSANT (pièces simples)
INSERT INTO COMPOSANT (nomC, id_composant, prix_unitaire) VALUES
('Vis en titane', 1, 2.50),
('Rivet en aluminium', 2, 0.50),
('Raidisseur composite', 3, 15.00),
('Plaque en alliage', 4, 100.00);

-- Inserts ASSEMBLER (pièces composées)
INSERT INTO ASSEMBLER (idA, id_isA, quantite) VALUES
-- Panneau de fuselage
(5, 1, 9),  -- 9 vis en titane
(5, 2, 20), -- 20 rivets en aluminium
(5, 3, 4),  -- 4 raidisseurs composite
(5, 4, 1),  -- 1 plaque en alliage
-- Segment de fuselage
(6, 5, 2),  -- 2 panneaux de fuselage
(6, 3, 8),  -- 8 raidisseurs composite
(6, 1, 30), -- 30 vis en titane
-- Aile principale
(7, 4, 3),  -- 3 plaques en alliage
(7, 1, 50), -- 50 vis en titane
(7, 2, 100), -- 100 rivets en aluminium
-- Empennage
(9, 4, 1),  -- 1 plaque en alliage
(9, 1, 15), -- 15 vis en titane
(9, 2, 40), -- 40 rivets en aluminium
-- Cockpit
(10, 4, 2), -- 2 plaques en alliage
(10, 1, 20), -- 20 vis en titane
(10, 2, 60), -- 60 rivets en aluminium
-- Avion complet
(8, 6, 3),  -- 3 segments de fuselage
(8, 7, 2),  -- 2 ailes principales
(8, 9, 1),  -- 1 empennage
(8, 10, 1); -- 1 cockpit
