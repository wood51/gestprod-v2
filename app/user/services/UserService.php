<?php

class UserService
{
   

   function get_all_users()
   {
      return UsersModel::all(true);
   }

   function get_all_active_users() {
      return UsersModel::all();
   }

   function create_user($data)
   {
      UsersModel::add($data);
   }

   function edit_user($user_id,$data) {
      UsersModel::edit($user_id,$data);
   }

   function delete_user($user_id) {
      UsersModel::delete(($user_id));
   }

   function get_user_by_id($user_id) {
      return UsersModel::get_by_id($user_id);
   }

}
