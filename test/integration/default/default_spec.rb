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
