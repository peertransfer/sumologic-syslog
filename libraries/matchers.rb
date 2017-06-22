if defined?(ChefSpec)
  def create_sumologic_syslog_rsyslog(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:sumologic_syslog_rsyslog, :create, resource_name)
  end

  def remove_sumologic_syslog_rsyslog(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:sumologic_syslog_rsyslog, :remove, resource_name)
  end
end
