<?php
class UserController
{
    protected $service;
    public function __construct()
    {
        $this->service = new UserService();
    }

    /**
     * @route("GET /user")
     */
    function index($f3)
    {
        $f3->users = $this->service->get_all_active_users();
        echo \Template::instance()->render("user/users.html");
    }

    /**
     * @route("GET /user/@user_id/confirm-delete")
     */
    function confirm_delete($f3, $params)
    {
        $user = $this->service->get_user_by_id($params['user_id']);
        $f3->set('user', $user);
        echo \Template::instance()->render('user/partials/_modal_confirm_delete.html');
    }

    /**
     * @route("GET /user/list")
     */
    function user_list($f3)
    {
        $f3->users = $this->service->get_all_active_users();
        echo \Template::instance()->render("user/partials/_users_list.html");
    }

    /**
     * @route("GET /user/create-form")
     */
    function user_create_form()
    {
        echo \Template::instance()->render('user/partials/_modal_user_form.html');
    }

    /**
     * @route("POST /user/create")
     */
    function user_create($f3)
    {
        $data = $f3->POST;
        $this->service->create_user($data);
        \Flash::instance()->addMessage("Utilisateur crée", "info");
        header("HX-Trigger: refreshUserList,showFlash");
        http_response_code(204);
    }

    /**
     * @route("DELETE /user/@user_id")
     */
    function user_delete($f3, $param)
    {
        $this->service->delete_user($param['user_id']);
        \Flash::instance()->addMessage("Utilisateur supprimer", "info");
        header("HX-Trigger: showFlash");
        http_response_code(200);
    }
}
