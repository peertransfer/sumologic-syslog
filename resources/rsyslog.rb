resource_name 'sumologic_syslog_rsyslog'

property :cookbook, String, default: 'sumologic-syslog'
property :deployment, String, default: 'eu'
property :port, String, default: '6514'
property :token, String

default_action :create

action :create do
  include_recipe 'rsyslog::default'

  remote_file '/etc/syslog.sumologic.crt' do
    source 'https://www.geotrust.com/resources/root_certificates/certificates/GeoTrust_Primary_CA.pem'
  end

  template '/etc/rsyslog.d/sumologic.conf' do
    source 'sumologic.conf.erb'
    user 'root'
    group 'root'
    mode '600'
    variables(
      deployment: new_resource.deployment,
      port: new_resource.port,
      token: new_resource.token
    )
    cookbook new_resource.cookbook
  end
end

action :remove do
  file '/etc/rsyslog.d/sumologic.conf' do
    action :delete
  end
  file '/etc/syslog.sumologic.crt' do
    action :delete
  end
end
