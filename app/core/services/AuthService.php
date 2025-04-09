<?php

class AuthService
{
    /**
     * Tente de connecter l'utilisateur
     * @param string $username
     * @param string $password
     * @return bool True si login OK, sinon false
     */
    public static function login(string $username, string $password) {
        $user = UsersModel::get_by_username($username);
        if(password_verify($password,$user->password)) {
            $_SESSION['user'] = $user->cast();
            return true;
        } 

        return false;
        
    }

    /**
     * Déconnecte l'utilisateur actuel
     * @return void
     */
    public static function logout() {}

    /**
     * Vérifie si un utilisateur est connecté
     * @return bool
     */
    public static function check() {}

    /**
     * Retourne l'utilisateur connecté (tableau ou objet casté)
     * @return array|null
     */
    public static function user() {}
}
