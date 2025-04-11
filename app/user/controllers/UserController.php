<?php
class UserController {

    /**
     * @route("GET /user")
     */
    function index($f3)
    {
        echo \Template::instance()->render("users/users.html");
    }

    /**
     * @route("GET /user/list")
     */
    function user_list($f3) {
        
    }
}