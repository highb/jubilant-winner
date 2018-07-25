plan pupperbox::deploy(
  String[1] $host
) {
  run_task('package', $host, name => 'tmux', action => 'install')
}
