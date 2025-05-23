<?php
class PerformanceChartService
{
    public function calculPerformance($semaine)
    {
        try {
            $annee_number = explode("-", $semaine)[0];
            $semaine_number = explode("-", $semaine)[1];
            $operateurs = PresenceModel::getNbOperateursSemaine($semaine_number, $annee_number); // TODO MODIF PRESENCE POUR SEMAINE UNIQUE ?????????????
            $nb_machines_prete = ProdEngagementModel::getNbMachinePretes($semaine);
            $objectif_production = $operateurs['total_operateurs'];
            $indice_performance = ($objectif_production) ? round(($nb_machines_prete / $objectif_production) * 100, 2) : 0;
            return $indice_performance;

        } catch (\Exception $e) {
            throw new \Exception("Erreur lors du calcul de la performance: " . $e->getMessage());
        }
    }
}
