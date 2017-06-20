require_relative '../spec_helper'

describe 'sumologic-syslog-test::rsyslog' do
  cached(:subject) do
    runner = ChefSpec::SoloRunner.new(step_into: %w(sumologic_syslog_rsyslog))
    runner.converge(described_recipe)
  end
  let(:node) { subject.node }

  it { is_expected.to include_recipe('rsyslog::default') }
end
