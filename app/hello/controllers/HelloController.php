<?php

class HelloController
{
    /**
     * @route("GET /")
     */
    public function index($f3)
    {
       echo \Template::instance()->render("hello/hello.html");
    }
}