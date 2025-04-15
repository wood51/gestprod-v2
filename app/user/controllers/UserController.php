<?php
class UserController
{
    protected $service;
    public function __construct()
    {
        $this->service = new UserService();
    }

    /********************************
     * Page
     *******************************/

    /**
     * @route("GET /users")
     * Content Utlisateurs
     */
    function index($f3)
    {
        $f3->users = $this->service->get_all_active_users();
        echo \Template::instance()->render("user/users.html");
    }

    /********************************
     * Partials
     *******************************/

    /**
     * @route("GET /users/list")
     * Partials  liste des utilisateur
     */
    function user_list($f3)
    {
        $f3->users = $this->service->get_all_active_users();
        echo \Template::instance()->render("user/partials/_users_list.html");
    }

    /**
     * @route("GET /user/@user_id/confirm-delete")
     * Partials Modale de confirmation suppression
     */
    function confirm_delete($f3, $params)
    {
        $user = $this->service->get_user_by_id($params['user_id']);
        $f3->set('user', $user);
        echo \Template::instance()->render('user/partials/_modal_confirm_delete.html');
    }



    /**
     * @route("GET /user/create-form")
     * Partials Modale form utilisateurs mode création 
     */
    function user_create_form($f3)
    {
        $f3->mode = "create";
        $f3->title = "Ajouter un utlisateur";
        $f3->htmx_form_action = 'hx-post="/user"';
        $f3->password_state = "required";
        $f3->btn_title = "Ajouter";
        $f3->selected_roles = [
            'user' => 'selected',
            'superuser' => '',
            'admin' => ''
        ];

        echo \Template::instance()->render('user/partials/_modal_user_form.html');
    }

    /**
     * @route("GET /user/@user_id/edit-form")
     * Partials Modale form utilisateurs mode edition 
     */
    function user_edit_form($f3, $params)
    {
        $user = $this->service->get_user_by_id($params['user_id']);
        $f3->user = $user;
        $f3->mode = "edit";
        $f3->title = "Modifier un utlisateur";
        $f3->htmx_form_action = 'hx-put="/user/' . $user->_id . '"';
        $f3->password_state = "disabled";
        $f3->btn_title = "Modifier";
        $f3->selected_roles = [
            'user' => $user->role == 'user' ? 'selected' : '',
            'superuser' => $user->role == 'superuser' ? 'selected' : '',
            'admin' => $user->role == 'admin' ? 'selected' : '',
        ];

        echo \Template::instance()->render('user/partials/_modal_user_form.html');
    }

    /********************************
     * CRUD
     *******************************/

    /**
     * @route("POST /user")
     * CRUD Create
     */
    function user_create($f3)
    {
        $data = \RequestsHelper::getRequestData();
        $this->service->create_user($data);

        \Flash::instance()->addMessage("Utilisateur crée", "info");
        header("HX-Trigger: refreshUserList,showFlash");
        http_response_code(204);
    }

    /**
     * @route("PUT /user/@user_id")
     * CRUD Update
     */
    function user_edit($f3, $params)
    {
        $data=\RequestsHelper::getRequestData();
        
        $this->service->edit_user($params['user_id'], $data);

        \Flash::instance()->addMessage("Utilisateur mis à jour", "success");
        header("HX-Trigger: refreshUserList,showFlash");
        http_response_code(204);
    }


    /**
     * @route("DELETE /user/@user_id")
     * CRUD Delete
     */
    function user_delete($f3, $param)
    {
        $this->service->delete_user($param['user_id']);
        \Flash::instance()->addMessage("Utilisateur supprimer", "info");
        header("HX-Trigger: showFlash");
        http_response_code(200);
    }
}
