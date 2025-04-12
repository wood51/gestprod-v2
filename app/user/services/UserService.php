<?php

class UserService {
   function get_all_users() {
   return UsersModel::get_all();
   
   }
}