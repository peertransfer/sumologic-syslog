require_relative '../../spec_helper'

describe 'sumologic-syslog-test::rsyslog-remove' do
  cached(:subject) do
    runner = ChefSpec::SoloRunner.new(step_into: 'sumologic_syslog_rsyslog')
    runner.converge(described_recipe)
  end
  let(:node) { subject.node }

  it 'removed rsyslog config file' do
    is_expected.to delete_file('/etc/rsyslog.d/sumologic.conf')
    is_expected.to delete_file('/etc/syslog.sumologic.crt')
  end
end
