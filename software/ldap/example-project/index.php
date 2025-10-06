<?php

/**
 * Login DN: cn=admin,dc=example,dc=com
 * Password: admin
 */

$host   = getenv('LDAP_HOST');
$port   = getenv('LDAP_PORT');
$baseDn = getenv('LDAP_BASE_DN');
$bindDn = getenv('LDAP_BIND_DN');
$bindPw = getenv('LDAP_BIND_PW');

$ds = ldap_connect($host, $port);
ldap_set_option($ds, LDAP_OPT_PROTOCOL_VERSION, 3);
ldap_set_option($ds, LDAP_OPT_REFERRALS, 0);

if (!@ldap_bind($ds, $bindDn, $bindPw)) {
    die('Не удалось привязаться к LDAP');
}

$filter = "(objectClass=person)";
$result = ldap_search($ds, $baseDn, $filter);
$entries = ldap_get_entries($ds, $result);

print_r($entries);
