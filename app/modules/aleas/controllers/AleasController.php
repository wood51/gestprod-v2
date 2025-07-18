<?php
class AleasController
{
    /**
     * @route("GET /alea")
     */
    public function aleas($f3)
    {
        $f3->operateurs = UsersModel::all_prod();
        echo \Template::instance()->render('/aleas/form_aleas.html');
    }
}
