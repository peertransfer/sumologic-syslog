sumologic-syslog Cookbook
========================

Installs [sumologic-syslog](https://help.sumologic.com/Send_Data/Sources/02Sources_for_Hosted_Collectors/Cloud_Syslog_Source)

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
end
```

Where:


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
  - Jose Luis Salas <josacar@users.noreply.github.com>
