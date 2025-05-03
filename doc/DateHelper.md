### 📄 Notice rapide pour build()

``DateHelper::build($annee = null, $mois = null)``

|Variable|Signification|
|:-------|:------------|
|datetime|	Date du contexte (affichage).|
|annee|	Année numérique.|
|mois|	Mois numérique.|
|jour|	Jour du mois.|
|semaine|	Numéro ISO de la semaine.|
|aujourdhui|	Date réelle du jour (jamais liée au contexte).|
|premier_jour_mois|	DateTimeImmutable du 1ᵉʳ du mois.|
|nb_jours_mois|	Nombre de jours dans ce mois (28 à 31).|
|first_day_of_month|	Numéro du jour de la semaine du 1ᵉʳ jour (1=lundi, 7=dimanche).|