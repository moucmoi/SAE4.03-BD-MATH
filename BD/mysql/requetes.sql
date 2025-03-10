--requete 1
SELECT a.nom AS composant, sum(ass.quantite) as quantite
FROM ASSEMBLAGE parent
JOIN ASSEMBLER ass ON parent.id_assemblage = ass.idA
JOIN ASSEMBLAGE a ON ass.id_isA = a.id_assemblage
GROUP BY a.nom;



--requete 2
WITH RECURSIVE CompositionComplete AS (
    -- Cas de base : relations directes entre assemblages
    SELECT ASM.idA AS assemblage_principal, ASM.id_isA AS sous_element, ASM.quantite
    FROM ASSEMBLER ASM
    UNION ALL
    
    -- Cas récursif : on descend dans la hiérarchie
    SELECT CC.assemblage_principal, ASM.id_isA, CC.quantite * ASM.quantite
    FROM CompositionComplete CC
    JOIN ASSEMBLER ASM ON CC.sous_element = ASM.idA
)

SELECT A.id_assemblage, A.nom, COUNT(DISTINCT CC.sous_element) AS nombre_composants_differents
FROM ASSEMBLAGE A LEFT JOIN CompositionComplete CC ON A.id_assemblage = CC.assemblage_principal LEFT JOIN COMPOSANT C ON CC.sous_element = C.id_composant
WHERE A.id_assemblage NOT IN (SELECT id_composant FROM COMPOSANT)
GROUP BY A.id_assemblage, A.nom
ORDER BY nombre_composants_differents DESC;



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
