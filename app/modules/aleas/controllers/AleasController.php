<?php
class AleasController
{
    /**
     * @route("GET /alea")
     */
    public function aleas($f3)
    {
        echo \Template::instance()->render('/aleas/form_aleas.html');
    }
}
