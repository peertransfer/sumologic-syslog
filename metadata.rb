name             'sumologic-syslog'
maintainer       'Flywire Corp.'
maintainer_email 'engineering@flywire.com'
license          'MIT'
description      'Installs/Configures sumologic to send logs via syslog'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.4.0'

issues_url 'https://github.com/peertransfer/sumologic-syslog/issues'
source_url 'https://github.com/peertransfer/sumologic-syslog'

depends 'rsyslog'

chef_version '>= 12.9'

supports 'debian'
