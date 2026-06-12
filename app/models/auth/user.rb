module Auth
  class User < ApplicationRecord
    include Model::User if defined? RailsAuth
    include Notice::Ext::User if defined? RailsNotice
    include Org::Ext::User if defined? RailsOrg
    include Roled::Ext::User
  end
end
