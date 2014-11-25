class simplesamlphp::remote_idp (
  $ensure = present,
  $authproc = undef,
  $base64_attributes = FALSE,
  $cert_data = undef,
  $cert_fingerprint = undef,
  $certificate = undef,
  $description = undef,
  $entity_id = undef,
  $icon = undef,
  $name = undef,
  $organization_name = undef,
  $organization_display_name = undef,
  $organization_url = undef,
  $sso_url = undef,
) {
  
  if !defined($entity_id) {
    fail('No entity ID defined for remote IdP')
  }
  
  if !defined($sso_url) {
    fail('No SSO URL defined for remote IdP')
  }

  file { '/var/www/simplesamlphp/metadata/saml20-idp-remote.php':
    owner => 'root',
    group => 'root',
    mode  => '0644',
    content => template("${module_name}/saml20-idp-remote.php.erb")
  }
}