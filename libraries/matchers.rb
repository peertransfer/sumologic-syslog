if defined?(ChefSpec)
  def create_sumologic_syslog_rsyslog(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:sumologic_syslog_rsyslog, :create, resource_name)
  end

  def enable_sumologic_syslog_rsyslog(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:sumologic_syslog_rsyslog, :enable, resource_name)
  end
end
