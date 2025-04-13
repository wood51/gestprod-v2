<?php

class UserHelper {
    public static function generate_username($nom, $prenom)
   {
      $prefix = mb_substr($prenom, 0, 1) . mb_substr($nom, 0, 2);
      $prefix = strtolower(iconv('UTF-8', 'ASCII//TRANSLIT', $prefix));  // accents -> lettres
      $prefix = preg_replace('/[^a-z]/', '', $prefix);       // garde que a-z

      $count = 1;
      $user = new UsersModel();

      while ($user->load(['username = ?', $prefix . $count])) {
         $user->reset();
         $count++;
      }

      return $prefix . $count;
   } 
}