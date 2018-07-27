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


# Complications I encountered while setting up for

* (Unexpected) Needed to configure tty: true, and run-as: root in bolt.yaml
* (Unexpected) Needed to install the puppet agent (MANUALLY) to get packages to work.



* (Expected) Needed to install the modules locally with
```
puppet module install --modulepath ./bolt/modules rehan-ohmyzsh
```
* (Unexpected) rehan-ohmyzsh is horribly broken
* (Expected) Needed to install puppetlabs-docker
* (Unexpected) puppetlabs-docker errors
```
Finished: apply catalog with 1 failure in 2.17 sec
nearly was not ok: Apply failed to compile for Target('nearly', {"connect-timeout"=>10, "tty"=>true, "host-key-check"=>true, "private-key"=>"~/.ssh/id_rsa", "run-as"=>"root"}): /opt/puppetlabs/bolt/lib/ruby/gems/2.4.0/gems/bolt-0.21.3/vendored/puppet/lib/puppet/pops/functions/dispatcher.rb:34:in `dispatch': Evaluation Error: Error while evaluating a Function Call, 'downcase' parameter 'arg' expects a value of type Numeric, String, Array, or Hash, got Undef (file: /s/jubilant-winner/bolt/modules/docker/manifests/params.pp, line: 103, column: 40) (Puppet::PreformattedError)
```
