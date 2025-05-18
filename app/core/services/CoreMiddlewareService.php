<?php

class CoreMiddlewareService extends \Prefab{

    public static function base_middleware() {
        $middleware = Middleware::instance();

        $middleware->before('GET|POST /*', function($f3) {
            $public = ['/login', '/logout','/toast/messages','/api/excel/login'];
            if (!\AuthService::check() && !in_array($f3->PATH, $public)) {
                \Flash::instance()->addMessage("Authentification requise", "error");
                $f3->reroute('/login');
            }
        });

        $middleware->run();
    }

}