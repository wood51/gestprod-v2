<?php
class CoreController
{
    /**
     * @route("GET /")
     */
    function index($f3)
    {
        $theme = "base";

        $f3->user = AuthService::user();

        $f3->aside_menu = \Template::instance()->render("themes/base/partials/_nav_principale.html");
        echo \Template::instance()->render("themes/$theme/" . $theme . "_layout.html");
    }

    /**
     * @route("GET /accueil-partials")
     */
    function accueil_partial($f3)
    {
        $menu = \Template::instance()->render("themes/base/partials/_nav_principale.html");
        $content = "";

        echo '<div id="aside_menu">' . $menu . '</div>';
        echo '<div id="content" class="p-4">' . $content . '</div>';
    }

    /**
     * @route("GET /toast/messages")
     */
    function toastMessages($f3)
    {
        $f3->flash_messages = \Flash::instance()->getMessages();
        echo \Template::instance()->render('themes/base/components/toast/_toast_messages.html');
    }
}
