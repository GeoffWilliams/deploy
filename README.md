# deploy
module to setup mcollective to deploy to tomcat

# Example
```
mco rpc deploy deploy repository_base_url=http://10.20.1.4:8081/artifactory/simple repository_id=ext-release-local group_id=/org/geoserver/web artifact_id=gs-web-app version=2.6.2 service=tomcat deploy_dir=/var/lib/tomcat/webapps/geoserver -I centos65b.syd.puppetlabs.demo file_type="war"
```
