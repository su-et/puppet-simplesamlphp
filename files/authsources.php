<?php

$config = array(
    'admin' => array(
        'core:AdminPassword',
    ),

    'default-sp' => array(
        'saml:SP',

        'authproc' => array(
            20 => 'saml:NameIDAttribute',
        ),


        'entityID' => rtrim($_SERVER['SITE_URL'],'/'),

        'idp' => 'https://idp.itlab.stanford.edu/idp/shibboleth',

    ),
);

