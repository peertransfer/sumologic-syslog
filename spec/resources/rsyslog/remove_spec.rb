require_relative '../../spec_helper'

describe 'sumologic-syslog-test::rsyslog-remove' do
  cached(:subject) do
    runner = ChefSpec::SoloRunner.new(step_into: 'sumologic_syslog_rsyslog')
    runner.converge(described_recipe)
  end
  let(:node) { subject.node }
  let(:sumologic_cert) { '/etc/syslog.sumologic.pem' }

  it { is_expected.to include_recipe('rsyslog::default') }

  it 'notifies rsyslog service to restart' do
    resource = subject.find_resource('file', sumologic_cert)
    expect(resource).to notify('service[rsyslog]').to(:restart).delayed
  end

  it 'removed rsyslog config file' do
    is_expected.to delete_file('/etc/rsyslog.d/sumologic.conf')
    is_expected.to delete_file(sumologic_cert)
  end
end
