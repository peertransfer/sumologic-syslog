describe file('/etc/syslog.sumologic.crt') do
  it { is_expected.not_to exist }
end

describe file('/etc/rsyslog.d/sumologic.conf') do
  it { is_expected.not_to exist }
end
