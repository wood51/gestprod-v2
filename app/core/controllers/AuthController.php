<?php
class AuthController 
{

    /**
     * @route("GET /login")
     */
    function page_login($f3)
    {
        echo \Template::instance()->render("core/themes/base/login.html");
    }

    /**
     * @route("POST /login")
     */
    function login($f3)
    {

        if (AuthService::login($f3->POST['username'], $f3->POST['password'])) {
            \Flash::instance()->addMessage("Connexion réussi");
            $f3->reroute("/");
        } else {
            \Flash::instance()->addMessage("Erreur de connexion","error");
            $f3->reroute("/login");
        }
    }

    /**
     * @route("GET /logout")
     */
    function logout($f3) {
        AuthService::logout();
        $f3->reroute("/login");
    }
}
