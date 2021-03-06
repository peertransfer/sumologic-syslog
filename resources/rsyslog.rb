resource_name 'sumologic_syslog_rsyslog'

property :cookbook, String, default: 'sumologic-syslog'
property :deployment, String, default: 'eu'
property :port, String, default: '6514'
property :token, String
property :rsyslog_action, Symbol, default: :restart
property :tls_bundle_path, String, default: '/etc/syslog.sumologic.pem'

default_action :create

action :create do
  include_recipe 'rsyslog::default'

  package 'rsyslog-gnutls'

  cookbook_file '/etc/syslog.sumologic.pem' do
    cookbook new_resource.cookbook
    source 'digicert.pem'
    action :create
  end

  template '/etc/rsyslog.d/sumologic.conf' do
    source 'sumologic.conf.erb'
    user 'root'
    group 'root'
    mode '600'
    variables(
      deployment: new_resource.deployment,
      port: new_resource.port,
      token: new_resource.token,
      tls_bundle_path: new_resource.tls_bundle_path
    )
    cookbook new_resource.cookbook
    notifies(new_resource.rsyslog_action, 'service[rsyslog]', :delayed)
  end
end

action :remove do
  include_recipe 'rsyslog::default'

  file '/etc/rsyslog.d/sumologic.conf' do
    action :delete
  end

  file '/etc/syslog.sumologic.pem' do
    action :delete
    notifies(new_resource.rsyslog_action, 'service[rsyslog]', :delayed)
  end
end
