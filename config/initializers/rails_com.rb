RailsCom.config.tap do |config|
  config.default_admin_accounts = Rails.application.credentials[:admin_accounts]
  config.intercept_not_found = true
  config.debug = false
  config.debug_i18n = false
  config.ignore_models += [
    'SolidQueue::Semaphore',
    'SolidQueue::Process',
    'SolidQueue::Pause',
    'SolidQueue::Job',
    'SolidQueue::ScheduledExecution',
    'SolidQueue::ReadyExecution',
    'SolidQueue::BlockedExecution',
    'SolidQueue::RecurringExecution',
    'SolidQueue::RecurringTask',
    'SolidCache::Entry'
  ]
  config.override_prefixes = [
    'application'
  ]
  config.quiet_logs = [

  ]
end
