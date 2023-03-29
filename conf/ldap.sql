BEGIN;

DELETE FROM `qa_options` WHERE `title` IN (
	'ldap_authentication_attribute',
	'ldap_login_ad',
	'ldap_login_allow_normal',
	'ldap_login_filter',
	'ldap_login_fname',
	'ldap_login_generic_search',
	'ldap_login_hostname',
	'ldap_login_mail',
	'ldap_login_port',
	'ldap_login_sname'
);

INSERT INTO `qa_options` (`title`, `content`) VALUES
('ldap_authentication_attribute', 'uid'),
('ldap_login_ad', ''),
('ldap_login_allow_normal', ''),
('ldap_login_filter', '(objectClass=mailAccount)'),
('ldap_login_fname', 'givenname'),
('ldap_login_generic_search', 'uid=USERNAME,ou=users,dc=yunohost,dc=org/mail=USERNAME,ou=users,dc=yunohost,dc=org'),
('ldap_login_hostname', 'ldap://localhost'),
('ldap_login_mail', 'mail'),
('ldap_login_port', '389'),
('ldap_login_sname', 'sn');

UPDATE `qa_users` SET `sessionsource` = 'ldap';
INSERT INTO `qa_userlogins` (`userid`, `source`, `identifier`, `identifiermd5`) VALUES
((SELECT userid FROM `qa_users` WHERE `handle` = '__ADMIN__'), 'ldap', '__EMAIL__', UNHEX(MD5('__EMAIL__')));

COMMIT;
