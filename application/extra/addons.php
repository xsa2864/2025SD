<?php

return [
    'autoload' => false,
    'hooks' => [
        'app_init' => [
            'captcha',
            'crontab',
        ],
        'user_sidenav_after' => [
            'signin',
        ],
        'config_init' => [
            'summernote',
        ],
    ],
    'route' => [],
    'priority' => [],
    'domain' => '',
];
