<?php
class AleasController
{
    /**
     * @route("GET /aleas")
     */
    public function aleas($f3)
    {
        echo \Template::instance()->render('/aleas/form_aleas.html');
    }
}
