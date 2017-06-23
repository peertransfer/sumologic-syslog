directory 'rsyslog directory' do
  path '/etc/rsyslog.d'
end

file 'sumologic conf' do
  path '/etc/rsyslog.d/sumologic.conf'
end

file 'sumologic cert' do
  path '/etc/syslog.sumologic.crt'
end

sumologic_syslog_rsyslog 'default' do
  action :remove
end
