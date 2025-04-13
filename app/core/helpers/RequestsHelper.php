<?php

class RequestsHelper
{
    public static function getRequestData()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'PUT' || $_SERVER['REQUEST_METHOD'] === 'PATCH') {
            parse_str(file_get_contents('php://input'), $data);
            return $data;
        }
        return \Base::instance()->get('POST');
    }
}
