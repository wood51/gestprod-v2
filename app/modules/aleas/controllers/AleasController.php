<?php
class AleasController
{
    /**
     * @route("GET /alea")
     */
    public function aleas($f3)
    {
        $f3->operateurs = UsersModel::all_prod();
        $f3->types = ProdTypeSousEnsembleModel::find_type(['Alternateur','Compresseur','Redresseur']);
        echo \Template::instance()->render('/aleas/form_aleas.html');
    }

    /**
     * @route("GET /aleas/ref/")
     */
    public function getRef($f3) {
        $type = $f3->GET['type'];
        echo $type;
    }
}
