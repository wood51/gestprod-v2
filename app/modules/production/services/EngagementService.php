<?php

class EngagementService
{
    public static function engager(int $planningId, string $semaine): bool|string
    {
        $now = (new DateTimeImmutable())->format('Y-W');

        $model = new ProdEngagementModel();
        $last = $model->find(
            ['fk_planning = ?', $planningId],
            ['order' => 'modified_at DESC', 'limit' => 1]
        )[0] ?? null;

        $status = $last?->status ?? null;

        if (in_array($status, ['fait', 'annulé'])) {
            return "Engagement interdit (statut bloqué : $status).";
        }

        // Aucun engagement ou reporté -> créer une nouvelle ligne
        if (is_null($status) || $status === 'reporté') {
            $engagement = new ProdEngagementModel();
            $engagement->fk_planning = $planningId;
            $engagement->status = ($semaine === $now) ? 'engagé' : 'prévisionnel';
            $engagement->semaine_engagee = $semaine;
            $engagement->insert();
            return true;
        }

        // Si c'était prévisionnel → on le confirme
        if ($status === 'prévisionnel') {
            $last->status = 'engagé';
            $last->semaine_engagee = $semaine;
            $last->save();
            return true;
        }

        return "Aucune transition valide pour engagement depuis $status.";
    }

    public static function reporter(int $planningId): bool|string
    {
        $model = new ProdEngagementModel();
        $last = $model->find(
            ['fk_planning = ?', $planningId],
            ['order' => 'modified_at DESC', 'limit' => 1]
        )[0] ?? null;

        if (!$last || $last->status !== 'engagé') {
            return "Seul un engagement 'engagé' peut être reporté.";
        }

        $last->status = 'reporté';
        $last->semaine_engagee = null;
        $last->save();

        return true;
    }

    public static function marquerFait(int $planningId): bool|string
    {
        $model = new ProdEngagementModel();
        $last = $model->find(
            ['fk_planning = ?', $planningId],
            ['order' => 'modified_at DESC', 'limit' => 1]
        )[0] ?? null;

        if (!$last || !in_array($last->status, ['engagé', 'en cours'])) {
            return "Seul un engagement 'engagé' ou 'en cours' peut être marqué comme fait.";
        }

        $last->status = 'fait';
        $last->save();

        return true;
    }
}
