<?php

class UsersModel extends \DB\Cortex
{
    use \Validation\Traits\CortexTrait;

    protected
        $db = 'DB',
        $table = 'users',
        $primary='id',
        $fieldConf = [
            'username' => [
                'type' => 'varchar(4)',
                'nullable' => false,
                'unique' => true,
                'filter' => 'trim|lower_case',
                'validate' => 'required|alpha_numeric|exact_len,4'
            ],
            'password' => [
                'type' => 'varchar(255)',
                'nullable' => false,
                'filter' => 'trim',
                'validate' => 'required'
            ],
            'nom' => [
                'type' => 'varchar(255)',
                'nullable' => false,
                'filter' => 'trim|ucfirst',
                'validate' => 'required|alpha_space|min_len,1|max_len,255'
            ],
            'prenom' => [
                'type' => 'varchar(255)',
                'nullable' => false,
                'filter' => 'trim',
                'validate' => 'required|alpha_space|min_len,1|max_len,255'
            ],
            'role' => [
                'type' => 'enum("user","superuser","admin")',
                'nullable' => false,
                'default' => 'user',
                'filter' => 'trim|lower_case',
                'validate' => 'required'
            ],
            'created_at' => [
                'type' => 'datetime',
                'nullable' => true
            ],
            'deleted' => [
                'type' => 'int(1)',
                'nullable' => true
            ]
        ];


    public static function get_by_username($username, $deleted = false)
    {

        $users = new self();
        $users->load(['username = ? and deleted = ?', $username, (int)$deleted]);

        if ($users->dry()) {
            \Base::instance()->error_log->write("L'utlisateur n'existe pas");
            throw new PDOException("L'utlisateur n'existe pas");
        }

        return $users;
    }

    public static function all($deleted = false)
    {
        $users = new self();
        return $users->afind(['deleted = ?', $deleted]);
    }

    public static function all_sst() {
        $users = new self();
        return $users->afind(['sst > 0']);
    }

    public static function paginate_all($page,$limit,$deleted = false)
    {
        $users = new self();
        return $users->paginate($page-1,$limit,['deleted = ?', $deleted]);
    }

    public static function add($data)
    {

        $user = new self();

        $user->copyfrom($data); // remplit tous les champs

        $user->username = UserHelper::generate_username($user->nom, $user->prenom);
        $user->password = password_hash($data['password'], PASSWORD_BCRYPT);

        if (!$user->validate()) {
            throw new \Exception("La validation des données à échoué");
        }

        $user->insert();
        return $user;
    }

    public static function get_by_id($user_id)
    {
        $user = new self();
        $user->load(['_id = ?', $user_id]);
        return $user->dry() ? false : $user;
    }

    public static function delete($user_id)
    {
        $user = new self();
        $user->load(['_id = ?', $user_id]);
        $user->deleted = true;
        $user->update();
    }

    public static function edit($user_id, $data)
    {
        $user = new self();
        $user->load(['_id = ?', $user_id]);

        $old_prefix = UserHelper::calculate_username_prefix($user->nom, $user->prenom);
        $new_prefix = UserHelper::calculate_username_prefix($data['nom'], $data['prenom']);

        $user->copyfrom($data, ['nom', 'prenom', 'role']); // remplit tous les champs

        if ($old_prefix !== $new_prefix) {
            $user->username = UserHelper::generate_username($user->nom, $user->prenom);
        }

        if (!$user->validate()) {
            throw new \Exception("La validation des données à échoué");
        }

        $user->update();
        return $user;
    }
}
