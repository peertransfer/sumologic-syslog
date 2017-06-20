resource_name 'sumologic_syslog_rsyslog'

property :cookbook, String, default: 'sumologic-syslog'

default_action :create

action :create do
  include_recipe 'rsyslog::default'

end
