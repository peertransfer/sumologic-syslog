sumologic_syslog_rsyslog 'default' do
  token 'MagicToken@41123'
  tls_bundle_path '/etc/ssl/certs/ca-certificates.crt'

  action :create
end
