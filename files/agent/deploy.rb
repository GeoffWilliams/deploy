module MCollective
  module Agent
    class Deploy<RPC::Agent
      action "deploy" do
        repository_base_url = request[:repository_base_url]
        repository_id = request[:repository_id]
        group_id      = request[:group_id]
        group_id.gsub(".", "/")
        artifact_id   = request[:artifact_id]
        version       = request[:version]
        service       = request[:service]
        deploy_dir    = request[:deploy_dir]
        file_type     = request[:file_type]
        temp_file     = "/tmp/#{artifact_id}-#{version}.#{file_type}"
        url           = "#{repository_base_url}/#{repository_id}/#{group_id}/#{artifact_id}/#{version}/#{artifact_id}-#{version}.#{file_type}"

        reply[:output] = ""

        # Step 1 - download new .war file
        reply[:output] << run("curl -o #{temp_file} #{url}")

        # Step 2 - tomcat down
        reply[:output] << run("service #{service} stop")

        # Step 3 - remove current deployment
        reply[:output] << run("rm -rf #{deploy_dir}")

        # Step 4 - extract war file
        reply[:output] << run("mkdir #{deploy_dir} && cd #{deploy_dir} && unzip #{temp_file}")

        # Step 5 - tomcat up
        reply[:output] << run("/sbin/service #{service} start")
      end
    end
  end
end
