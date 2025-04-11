<?php

class AuthService
{

    /**
     * Tente de connecter l'utilisateur
     * @param string $username
     * @param string $password
     * @return bool True si login OK, sinon false
     */
    public static function login($username, $password): bool
    {
        try {
            $user = \UsersModel::get_by_username($username);

            if (password_verify($password, $user->password)) {
                $_SESSION['user'] = $user->cast();
                return true;
            } else {
                \Base::instance()->error_log->write("Mot de passe invalide");
            }
        } catch (\Exception $e) {
            \Base::instance()->error_log->write("EXCEPTION login: " . $e->getMessage());
        }

        return false;
    }


    /**
     * Déconnecte l'utilisateur actuel
     * @return void
     */
    public static function logout()
    {
        $f3 = \Base::instance();
        $f3->clear('SESSION');
    }

    /**
     * Vérifie si un utilisateur est connecté
     * @return bool
     */
    public static function check() {
        $f3 = \Base::instance();
        return isset($f3->SESSION['user']) ? true : false ;
    }

    /**
     * Retourne l'utilisateur connecté (tableau ou objet casté)
     * @return array|null
     */
    public static function user() {
        $f3 = \Base::instance();
        return $f3->SESSION['user'];
    }
}
