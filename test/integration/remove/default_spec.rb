describe file('/etc/syslog.sumologic.pem') do
  it { is_expected.not_to exist }
end

describe file('/etc/rsyslog.d/sumologic.conf') do
  it { is_expected.not_to exist }
end
