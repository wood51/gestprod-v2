<?php
class AuthController
{

    /**
     * @route("GET /login")
     */
    function page_login($f3)
    {
        echo \Template::instance()->render("themes/base/login.html");
    }

    /**
     * @route("POST /login")
     */
    function login($f3)
    {

        if (AuthService::login($f3->POST['username'], $f3->POST['password'])) {
            header("HX-Redirect: /");
            http_response_code(200);
        } else {
            \Flash::instance()->addMessage("Erreur de connexion", "error");
            header("HX-Trigger: showFlash");
            http_response_code(204);
        }
    }

    /**
     * @route("GET /logout")
     */
    function logout($f3)
    {
        AuthService::logout();
        $f3->reroute("/login");
    }
}
