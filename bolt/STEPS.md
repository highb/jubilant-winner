# Steps required to get started on Plans with Bolt

1. Install bolt
2. Create a module with `pdk new module <modulename>`
3. Create a plan in `modulename/plans/plan.pp`
4. Install puppet-agent on the box. :(
```
sudo rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm && yum install puppet-agent -y
  ```
5. Coming Soon(tm): Automation for puppet-agent install: https://github.com/puppetlabs/puppetlabs-puppet_agent/pull/302
6. Now you can use package, service, etc to manage your deployment
7. Run the plan
```/opt/puppetlabs/bolt/bin/bolt --modulepath ./bolt/modules plan run pupperbox::deploy host=nearly```
