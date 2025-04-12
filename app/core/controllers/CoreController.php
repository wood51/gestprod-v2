<?php
class CoreController
{
    /**
     * @route("GET /")
     */
    function index($f3)
    {
        $theme = "base";
        echo \Template::instance()->render("themes/$theme/" . $theme . "_layout.html");
    }

    /**
     * @route("GET /toast/messages")
     */
    function toastMessages($f3)
    {
        echo \Template::instance()->render('themes/base/components/toast/_toast_messages.html');
    }
}
