<?php

class PlanningController
{
    protected $service;

    public function __construct()
    {
        $this->service = new PlanningService();
    }

    /**
     * @route("GET /admin/planning/dashboard")
     */
    function planningDashboard($f3)
    {

        // Init Etat initial en session
        $f3->SESSION['filter_pret'] = false;
        $f3->SESSION['pagination_page'] = 0;
        $f3->SESSION['pagination_limit'] = 15;

        // Init Form Ajout 
        $f3->types = $this->service->getAvailableTypes(['Alternateur', 'Compresseur']); // Recup différent type
        $f3->mset($this->service->getRefsByType('Alternateur'));

        // Init template 
        $f3->filter_pret = false; // retour checkbox Prêt ?
        $f3->mset($this->service->getNowInfo());
        $f3->mset($this->service->paginatePlanning(0, 15, false));

        echo \Template::instance()->render("planning/planning_dashboard.html");
    }


    /**
     * @route("POST /planning/produit/add")
     * 
     */
    function planning_add($f3)
    {


        $this->service->addProduit([
            'type' => (int) $f3->POST['type'],
            'reference' => (int) $f3->POST['reference'],
            'semaine' => str_replace("W", "", $f3->POST['semaine'])
        ]);

        $f3->SESSION['pagination_page'] = 0;

        $this->service->renderPartialPlanning();
        echo \Template::instance()->render('themes/base/partials/_modal_clear.html');
    }

    /**
     * @route("GET /planning/filter/pret")
     */
    public function setFilterPret($f3)
    {
        $filter_pret = isset($f3->GET['filter_pret']) ? true : false;
        $f3->SESSION['filter_pret'] = $filter_pret;
        $this->service->renderPartialPlanning();
    }

    /**
     * @route("GET /planning/page/@page")
     */
    public function setPlanningPage($f3, $params)
    {
        $f3->SESSION['pagination_page'] = intval($params['page']) - 1;
        $this->service->renderPartialPlanning();
    }

    /**
     * @route("POST /planning/check-numero")
     */
    public function checkNumero($f3)
    {
        $key = array_key_first($f3->POST);
        $numero = $f3->POST[$key];
        $planningId = explode('-', $key)[1];

        $isUnique = ProdPlanningModel::isNumeroUnique($planningId, $numero);

        header('Content-Type: application/json');
        echo json_encode(['unique' => $isUnique]);
    }

    /**
     * @route("POST /planning/valider")
     */
    function valider($f3)
    {
        $db = new \DB\SQL\Mapper($f3->get('DB'), 'prod_planning');
        $db->load(['id = ?', $f3->POST['planning_id']]);

        if ($db->dry()) {
            http_response_code(404);
            echo "Produit introuvable.";
            return;
        }

        // MàJ des numéros si fournis
        if (!empty($f3->POST['numero'])) {
            $db->numero = $f3->POST['numero'];
        }

        // if (!empty($f3->POST['numero_rotor'])) {
        //     $db->numero_rotor = $f3->POST['numero_rotor'];
        // }

        // if (!empty($f3->POST['numero_stator'])) {
        //     $db->numero_stator = $f3->POST['numero_stator'];
        // }

        $db->save();

        // Ajout du contrôle qualité OK
        $controle = new \DB\SQL\Mapper($f3->get('DB'), 'qualite_controles');
        $controle->fk_planning = $db->id;
        $controle->fk_etat = 4; // À remplacer par l’ID réel de l’état "OK"
        $controle->hasDefaut = 0;
        $controle->commentaire = 'Contrôle validé';
        $controle->save();

        // Passage à "fait" dans engagement
        $eng = new \DB\SQL\Mapper($f3->get('DB'), 'prod_engagement');
        $eng->load(['fk_planning = ? AND status = ?', $db->id, 'engagé']);
        if (!$eng->dry()) {
            $eng->status = 'fait';
            $eng->save();
        }

        $this->service->renderPartialPlanning(); 

        echo \Template::instance()->render('/planning/partials/_planning_table.html');
        echo \Template::instance()->render('themes/base/partials/_modal_clear.html');
    }
}
