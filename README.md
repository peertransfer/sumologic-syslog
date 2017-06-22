sumologic-syslog Cookbook
========================

Installs [sumologic-syslog](https://help.sumologic.com/Send_Data/Sources/02Sources_for_Hosted_Collectors/Cloud_Syslog_Source)

Build Status
============

[![Build Status](https://travis-ci.org/peertransfer/sumologic-syslog.svg?branch=master)](https://travis-ci.org/peertransfer/sumologic-syslog)
[![Code Climate](https://codeclimate.com/github/peertransfer/sumologic-syslog/badges/gpa.svg)](https://codeclimate.com/github/peertransfer/sumologic-syslog)
[![Cookbook Version](https://img.shields.io/cookbook/v/sumologic-syslog.svg)](https://supermarket.chef.io/cookbooks/sumologic-syslog)

Requirements
------------

- A syslog server
- Chef 12

Usage
-----

#### sumologic-syslog::rsyslog

Just include `sumologic-syslog::rsyslog` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[sumologic-syslog::rsyslog]"
  ]
}
```

Providers
---------

**sumologic_rsyslog**

```ruby
sumologic_syslog_rsyslog 'default' do
  deployment 'eu'
  port '6514'
  token '__TOKEN__@4113'
  cookbook 'sumologic-rsyslog'

  action :create
end
```
Where:
- `deployment`: Sumologic deployment zone
- `port`: Sumologic cloud syslog port
- `token`: Sumologic cloud syslog token
- `cookbook`: rsyslog template cookbook to override
- `action`:
  - `create`: Add sumologic action
  - `remove`: Delete sumologic action

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

Authors:
  - Flywire Engineering
