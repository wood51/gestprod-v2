<?php

class HelloController
{
    /**
     * @route("GET /hello")
     */
    public function index()
    {
        echo \Template::instance()->render('hello.html');
    }
}
