<?php
class SortiesController
{

    /**
     * @route("GET /sorties")
     */
    function index($f3)
    {
        $f3->sorties = VueSortiesModel::all();
        echo \Template::instance()->render("sorties/sorties.html");
    }

    // /**
    //  * @route("GET /sorties/list)
    //  */
    // function list($f3)
    // {
    //     $sorties = \SortiesModel::all();
    //     $f3->set('sorties', $sorties);
    //     echo \Template::instance()->render("sorties/sorties_list.html");
    // }
}
