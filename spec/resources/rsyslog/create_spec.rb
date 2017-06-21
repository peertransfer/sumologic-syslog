require_relative '../../spec_helper'

describe 'sumologic-syslog-test::rsyslog-create' do
  cached(:subject) do
    runner = ChefSpec::SoloRunner.new(step_into: %w[sumologic_syslog_rsyslog])
    runner.converge(described_recipe)
  end
  let(:node) { subject.node }

  it { is_expected.to include_recipe('rsyslog::default') }

  it { is_expected.to install_package('rsyslog-gnutls') }

  it 'downloads required CA' do
    is_expected.to create_remote_file('/etc/syslog.sumologic.crt').
      with(source: 'https://www.geotrust.com/resources/root_certificates/certificates/GeoTrust_Primary_CA.pem')
  end

  it 'renders rsyslog config file' do
    is_expected.to render_file('/etc/rsyslog.d/sumologic.conf').
      with_content('syslog.collection.eu.sumologic.com')
    is_expected.to render_file('/etc/rsyslog.d/sumologic.conf').
      with_content('6514')
    is_expected.to render_file('/etc/rsyslog.d/sumologic.conf').
      with_content('MagicToken@41123')
  end
end
