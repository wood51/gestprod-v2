<?php
class TestControler
{
    /**
     * @route("GET /run-tests")
     */
    function test_username_generation_logic()
    {
        $test = new Test();
        // Nettoyage préalable (optionnel)
        $db = \Base::instance()->get('DB');
        $db->exec('DELETE FROM users WHERE username LIKE ?', ['dpo%']);

        // Création initiale
        $data = [
            'nom' => 'Poulin',
            'prenom' => 'David',
            'password' => 'test',
            'role' => 'user'
        ];
        $user = \UsersModel::add($data);
        $test->expect($user->username === 'dpo1', 'Création : username attendu dpo1');

        $id = $user->_id;

        // Édition sans changer nom/prénom
        \UsersModel::edit($id, [
            'nom' => 'Poulin',
            'prenom' => 'David',
            'role' => 'superuser'
        ]);
        $user->load(['_id = ?', $id]);
        $test->expect($user->username === 'dpo1', 'Édition sans changement : username doit rester dpo1');

        // Édition avec changement nom/prénom
        \UsersModel::edit($id, [
            'nom' => 'David',
            'prenom' => 'Poulin',
            'role' => 'admin'
        ]);
        $user->load(['_id = ?', $id]);
        $test->expect(str_starts_with($user->username, 'dpo'), 'Édition avec changement : username doit commencer par pda');

        echo "<pre>" . print_r($test->results(), true) . "</pre>";
    }
}
