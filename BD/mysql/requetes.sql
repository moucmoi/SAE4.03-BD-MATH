--requete 1
SELECT nomC, sum(quantite) as quantite from COMPOSANT NATURAL JOIN ASSEMBLER GROUP BY(nomC);


--requete 2



--requete 3
SELECT COUNT(*) FROM ASSEMBLAGE WHERE nom NOT IN (SELECT nomC FROM COMPOSANT);


--requete 4



--requete 5
