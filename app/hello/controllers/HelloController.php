<?php

class HelloController
{
    /**
     * @route("GET /")
     */
    public function index()
    {
        echo var_dump(\AuthService::login("dpo","davi"));
        echo \Template::instance()->render('hello.html');
    }
}
