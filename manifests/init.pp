class deploy(
  $agent_name = $deploy::params::mc_agent_name,
  $app_name   = $deploy::params::mc_app_name,
  $agent_ddl  = $deploy::params::mc_agent_ddl_name,
  $agent_path = $deploy::params::mc_agent_path,
  $app_path   = $deploy::params::mc_application_path,
  $mc_service = $deploy::params::mc_service_name,
) inherits deploy::params {


  File {
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  # Install the agent and its ddl file
#  file { "${app_path}/${app_name}" :
#    source => "puppet:///modules/${module_name}/application/${agent_name}",
#  }
 
  file { "${agent_path}/${agent_ddl}" :
    source => "puppet:///modules/${module_name}/agent/${agent_ddl}",
  }
  
# Install the application file (all masters at the moment)
  file { "${agent_path}/${agent_name}" :
    source => "puppet:///modules/${module_name}/agent/${agent_name}",
    require => File["${agent_path}/${agent_ddl}"],
  }
  
  Service <| title == $mc_service |> {
    subscribe +> [ 
      File["${agent_path}/${agent_name}"], 
      File["${agent_path}/${agent_ddl}"] 
    ],
  }

}
