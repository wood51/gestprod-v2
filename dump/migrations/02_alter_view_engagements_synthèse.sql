CREATE OR REPLACE VIEW vue_engagements_synthese AS
SELECT
    pe.semaine_engagee AS semaine_engagee,
    pa.reference AS reference,
    ptse.designation AS type_sous_ensemble,
    pte.libelle AS type_ensemble,
    pa.coefficient AS coefficient,
    pa.couleur AS couleur,
    pte.ordre_affichage,
    COUNT(pe.id) AS engagement,
    SUM(CASE WHEN pe.status = 'fait' THEN 1 ELSE 0 END) AS produit,
    SUM(CASE WHEN pe.status = 'reporte' THEN 1 ELSE 0 END) AS reporté
FROM
    prod_engagement pe
    JOIN prod_planning pp ON pe.fk_planning = pp.id
    JOIN prod_articles pa ON pp.fk_article = pa.id
    JOIN prod_type_sous_ensemble ptse ON pa.fk_type_sous_ensemble = ptse.id
    JOIN prod_type_ensemble pte ON pa.fk_type_sous_ensemble = pte.fk_type_sous_ensemble
GROUP BY
    pa.reference,
    pe.semaine_engagee
ORDER BY
    pa.reference;
