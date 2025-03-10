--requete 1
SELECT nomC, sum(quantite) as quantite from COMPOSANT NATURAL JOIN ASSEMBLER GROUP BY(nomC);


--requete 2



--requete 3
SELECT COUNT(*) FROM ASSEMBLAGE WHERE nom NOT IN (SELECT nomC FROM COMPOSANT);


--requete 4
DELIMITER //
CREATE FUNCTION CalculerCoutAssemblage(id_assem INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE cout_total DECIMAL(10,2);
    
    -- Vérifier si c'est un composant de base
    SELECT prix_unitaire INTO cout_total 
    FROM COMPOSANT 
    WHERE id_composant = id_assem;
    
    -- Si c'est un composant de base, on retourne son prix
    IF cout_total IS NOT NULL THEN
        RETURN cout_total;
    END IF;
    
    -- Sinon, c'est un assemblage, on calcule la somme de ses composants
    SELECT SUM(
        CalculerCoutAssemblage(ass.id_isA) * ass.quantite
    ) INTO cout_total
    FROM ASSEMBLER ass
    WHERE ass.idA = id_assem;
    
    RETURN COALESCE(cout_total, 0);
END //
DELIMITER ;

-- Utilisation de la fonction dans une requête
SELECT 
    a.id_assemblage, 
    a.nom AS piece_composee, 
    CalculerCoutAssemblage(a.id_assemblage) AS cout_total
FROM ASSEMBLAGE a
WHERE a.id_assemblage NOT IN (SELECT id_composant FROM COMPOSANT)
ORDER BY a.id_assemblage;



--requete 5
