max_threads_count = ENV.fetch('RAILS_MAX_THREADS') { 1 }
min_threads_count = ENV.fetch('RAILS_MIN_THREADS') { max_threads_count }
dir = ENV['PWD']

#workers 1
threads min_threads_count, max_threads_count
worker_timeout 3600 if ENV.fetch('RAILS_ENV', 'development') == 'development'
port ENV.fetch('PORT') { 3000 }
environment ENV.fetch('RAILS_ENV') { 'development' }
pidfile ENV.fetch('PIDFILE') { 'tmp/pids/server.pid' }

#state_path "#{File.expand_path('tmp/sockets/puma.state', dir)}"
#prune_bundler true
#early_hints true
#bind "unix://#{File.expand_path('tmp/sockets/puma.sock', dir)}"
state_path 'tmp/sockets/puma.state'
activate_control_app "unix://#{File.expand_path('tmp/sockets/pumactl.sock', dir)}"

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end
on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

on_restart do
  puts "\n-----> On restart"
  puts "env: #{@options[:environment]}"
  puts "pidfile: #{@options[:pidfile]}"
  puts "binds: #{@options[:binds]}"
  puts "control_url: #{@options[:control_url]}"
end

plugin :tmp_restart
