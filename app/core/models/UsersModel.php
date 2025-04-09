<?php

class UsersModel extends \DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'users';

    public static function get_by_username($user_name)
    {

        $users = new self();
        $users->load(['username = ?', $user_name]);

        if ($users->dry()) {
            \Base::instance()->error_log->write("L'utlisateur n'existe pas");
            throw new PDOException("L'utlisateur n'existe pas");
        }

        return $users;
    }
}
