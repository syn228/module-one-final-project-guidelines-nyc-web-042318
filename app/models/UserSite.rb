class UserSite < ActiveRecord::Base
  has_many :users
  has_many :sites
end
