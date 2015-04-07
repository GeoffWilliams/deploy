metadata :name        => "deploy",
         :description => "deploy war files to tomcat",
         :author      => "Geoff Williams",
         :license     => "MIT",
         :version     => "1.0",
         :url         => "http://www.puppetlabs.com",
         :timeout     => 900

action 'deploy', :description => "Deploy a war file" do
  input :repository_base_url,
        :prompt       => "Repository base url",
        :description  => "Repository base url",
        :type         => :string,
        :validation   => '.',
        :optional     => false,
        :maxlength    => 1024

  input :repository_id,
        :prompt       => "Repository ID",
        :description  => "Repository ID",
        :type         => :string,
        :validation   => '.',
        :optional     => false,
        :maxlength    => 256

  input :group_id,
        :prompt       => "Group ID",
        :description  => "Group ID",
        :type         => :string,
        :validation   => '.',
        :optional     => false,
        :maxlength    => 256

  input :artifact_id,
        :prompt       => "Artifcat ID",
        :description  => "Artifact ID",
        :type         => :string,
        :validation   => '.',
        :optional     => false,
        :maxlength    => 256

  input :version,
        :prompt       => "Version",
        :description  => "Version",
        :type         => :string,
        :validation   => '.',
        :optional     => false,
        :maxlength    => 256

  input :service,
        :prompt       => "Service",
        :description  => "Service to restart after deployment",
        :type         => :string,
        :validation   => '.',
        :optional     => false,
        :maxlength    => 256
 
  input :deploy_dir,
        :prompt       => "Deploy dir",
        :description  => "Directory to deploy to",
        :type         => :string,
        :validation   => '.',
        :optional     => false,
        :maxlength    => 256
  
  input :file_type,  
        :prompt       => "Type",
        :description  => "Type",
        :type         => :string,
        :validation   => '.',
        :optional     => true,
        :default      => "war",
        :maxlength    => 32

  output :output,
         :description => "Output from deployment commands",
         :display_as  => "Output"

  output :error,
         :description => "Error from deployment commands",
         :display_as  => "Errors"

  display :always
end


