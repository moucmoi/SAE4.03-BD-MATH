--requete 1



--requete 2



--requete 3 Listez les pièces composées triées par le nombre de composants qu’elles contiennent
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
--requete 4



--requete 5
