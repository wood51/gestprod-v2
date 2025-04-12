<?php
class UserController {
    protected $service;
    public function __construct() {
        $this->service = new UserService();
    }

    /**
     * @route("GET /user")
     */
    function index($f3)
    {
   
        $f3->users = $this->service->get_all_users();
        echo \Template::instance()->render("user/users.html");
    }

    /**
     * @route("GET /user/list")
     */
    function user_list($f3) {
        
    }
}