<?php

class BaseController
{
    protected $db, $f3,$validation;

    public function __construct()
    {
        $this->f3 = Base::instance();
        $this->db = $this->f3->get('DB');
        $this->validation = ValidationPlugin::instance();
    }

}
