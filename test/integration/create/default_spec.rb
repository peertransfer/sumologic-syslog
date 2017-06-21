describe package('rsyslog') do
  it { should be_installed }
end

describe sysv_service('rsyslog') do
  it { is_expected.to be_installed }
end

describe sysv_service('rsyslog') do
  it { is_expected.to be_running }
end

describe sysv_service('rsyslog') do
  it { is_expected.to be_enabled }
end

describe file('/etc/syslog.sumologic.crt') do
  it { should be_file }
  its('content') { should match('-----BEGIN CERTIFICATE-----') }
end
