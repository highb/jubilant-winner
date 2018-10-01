# Steps required to get started on Plans with Bolt

1. [Install bolt](https://puppet.com/docs/bolt/0.x/bolt_installing.html)
2. Create a module with `pdk new module <modulename>`
3. Create a plan in `modulename/plans/plan.pp`
4. `$nodes.apply_prep` now gets puppet installed and collects facts automagically :) ~~Install puppet-agent on the box. :(
```
sudo rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm && yum install puppet-agent -y
  ```~~
6. Now you can use package, service, etc to manage your deployment
7. Run the plan
```bolt --modulepath ./bolt/modules plan run pupperbox::deploy -n devboxen```


# Complications I encountered while setting up for

* (Unexpected) Needed to configure tty: true, and run-as: root in bolt.yaml
* (Unexpected) Needed to install the puppet agent (MANUALLY) to get packages to work.
* ~~(Expected) Needed to install the modules locally with
```
puppet module install --modulepath ./bolt/modules rehan-ohmyzsh
```~~ now handled by `bolt puppetfile install`
* (Unexpected) rehan-ohmyzsh is horribly broken
* (Expected) Needed to install puppetlabs-docker
* (Unexpected) puppetlabs-docker errors
```
Finished: apply catalog with 1 failure in 2.17 sec
nearly was not ok: Apply failed to compile for Target('nearly', {"connect-timeout"=>10, "tty"=>true, "host-key-check"=>true, "private-key"=>"~/.ssh/id_rsa", "run-as"=>"root"}): /opt/puppetlabs/bolt/lib/ruby/gems/2.4.0/gems/bolt-0.21.3/vendored/puppet/lib/puppet/pops/functions/dispatcher.rb:34:in `dispatch': Evaluation Error: Error while evaluating a Function Call, 'downcase' parameter 'arg' expects a value of type Numeric, String, Array, or Hash, got Undef (file: /s/jubilant-winner/bolt/modules/docker/manifests/params.pp, line: 103, column: 40) (Puppet::PreformattedError)
```
* More puppetlabs-docker errors
```
q5dme1786a47guu.delivery.puppetlabs.net: Evaluation Error: Unknown function: 'ensure_packages'. (file: /s/jubilant-winner/bolt/modules/docker/manifests/repos.pp, line: 11, column: 3) on node q5dme1786a47guu.delivery.puppetlabs.net
/opt/puppetlabs/bolt/lib/ruby/gems/2.5.0/gems/bolt-0.24.0/vendored/puppet/lib/puppet/pops/evaluator/runtime3_support.rb:39:in `optionally_fail': Evaluation Error: Unknown function: 'ensure_packages'. (file: /s/jubilant-winner/bolt/modules/docker/manifests/repos.pp, line: 11, column: 3) on node q5dme1786a47guu.delivery.puppetlabs.net (Puppet::PreformattedError)
	from /opt/puppetlabs/bolt/lib/ruby/gems/2.5.0/gems/bolt-0.24.0/vendored/puppet/lib/puppet/pops/evaluator/runtime3_support.rb:21:in `fail'
	from /opt/puppetlabs/bolt/lib/ruby/gems/2.5.0/gems/bolt-0.24.0/vendored/puppet/lib/puppet/pops/evaluator/runtime3_support.rb:309:in `call_function'
	from /opt/puppetlabs/bolt/lib/ruby/gems/2.5.0/gems/bolt-0.24.0/vendored/puppet/lib/puppet/pops/evaluator/evaluator_impl.rb:976:in `call_function_with_block'
  ```
