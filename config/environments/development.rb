Rails.application.configure do

  config.enable_reloading = true
  config.eager_load = false
  config.consider_all_requests_local = true

  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.hosts += ['.lvh.me', 'localhost']

  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.cache_store = :file_store, 'tmp/cache/store'
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.action_controller.forgery_protection_verification_strategy = :header_or_legacy_token

  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false

  config.active_record.migration_error = :page_load

  config.active_storage.service = :local

  config.active_support.deprecation = :log

  config.action_view.annotate_rendered_view_with_filenames = true
end

Rails.application.routes.default_url_options = {
  protocol: 'http',
  host: 'lvh.me',
  port: 3000
}
