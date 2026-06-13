Rails.application.configure do

  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false

  config.public_file_server.enabled = true

  config.assets.compile = false

  config.i18n.fallbacks = true

  config.log_tags = [ :request_id ]
  config.log_level = :debug

  config.action_controller.perform_caching = true

  config.action_mailer.perform_caching = false

  config.active_support.report_deprecations = false

  config.active_record.dump_schema_after_migration = false

  config.active_storage.service = :local
end
