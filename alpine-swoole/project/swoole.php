<?php

$http = new Swoole\Http\Server('127.0.0.1', 9501);

$http->on('start', function ($server) {
    echo "http://127.0.0.1:9501\n";
});

$http->on('request', function ($request, $response) {
    $response->header('Content-Type', 'text/plain');
    $response->end('Привет мир');
});

$http->start();