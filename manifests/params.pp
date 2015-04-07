class deploy::params {
  $plugins_dir          = '/opt/puppet/libexec/mcollective/mcollective'
  $mc_service_name      = 'pe-mcollective'
  $mc_agent_name        = "${module_name}.rb"
  $mc_agent_ddl_name    = "${module_name}.ddl"
  $mc_app_name          = "${module_name}.rb"
  $mc_agent_path        = "${plugins_dir}/agent"
  $mc_application_path  = "${plugins_dir}/application"
}
