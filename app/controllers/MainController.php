<?php
class MainController
{
    public function index($f)
    {
        echo \Template::instance()->render("/layout/base/base_layout.html");
    }
}
