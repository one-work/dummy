port 3000
workers :auto
threads 2, 10
environment 'production'

activate_control_app 'tcp://localhost:9293', { no_token: true, data_only: true }

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

before_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)

  Rails.event.subscribe(EventRequestSubscriber.new) { |event| event[:name].start_with?('controller.') }
  Rails.event.subscribe(EventSqlSubscriber.new) { |event| ['active_record.sql'].include?(event[:name]) }
end

before_restart do
  puts "\n-----> On restart"
  puts "env: #{@options[:environment]}"
  puts "pidfile: #{@options[:pidfile]}"
  puts "binds: #{@options[:binds]}"
  puts "control_url: #{@options[:control_url]}"
end
