--requete 1
SELECT nomC, sum(quantite) as quantite from COMPOSANT NATURAL JOIN ASSEMBLER GROUP BY(nomC);


--requete 2



--requete 3
SELECT COUNT(*) FROM ASSEMBLAGE WHERE nom NOT IN (SELECT nomC FROM COMPOSANT);


--requete 4
WITH RECURSIVE EclatementPieces AS (
    -- PARTIE 1: POINT DE DÉPART - On commence par les liens directs entre pièces
    SELECT 
        ass.idA AS id_assemblage, 
        ass.id_isA AS id_sous_piece,
        ass.quantite,
        1 AS niveau
    FROM ASSEMBLER ass
    
    UNION ALL
    
    -- PARTIE 2: RÉCURSION - On descend dans les niveaux inférieurs
    SELECT 
        ep.id_assemblage,
        ass.id_isA,
        ep.quantite * ass.quantite,
        ep.niveau + 1
    FROM EclatementPieces ep
    JOIN ASSEMBLER ass ON ep.id_sous_piece = ass.idA
)

SELECT 
    a.nom AS piece_composee,
    ROUND(SUM(ep.quantite * c.prix_unitaire), 2) AS cout_total
FROM ASSEMBLAGE a
JOIN EclatementPieces ep ON a.id_assemblage = ep.id_assemblage
JOIN COMPOSANT c ON ep.id_sous_piece = c.id_composant
WHERE a.id_assemblage NOT IN (SELECT id_composant FROM COMPOSANT)
GROUP BY a.nom;



--requete 5
