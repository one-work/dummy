class ApplicationController < ActionController::Base
  if defined? RailsCom
    include Com::Controller::ErrHandler
    include Com::Controller::Application
    include Roled::Controller::Application
  end
  include Auth::Controller::Application if defined? RailsAuth
  include Org::Controller::Application if defined? RailsOrg

  protect_from_forgery trusted_origins: ['http://lvh.me:3000'], with: :exception, unless: -> { json_format? }

  before_action do
    ActiveStorage::Current.url_options = {
      port: request.port,
      host: request.host
    }
  end
end
