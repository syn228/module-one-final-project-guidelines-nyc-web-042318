class City < ActiveRecord::Base
  belongs_to :usercity
  has_many :users, through: :usercity
  has_many :sites
end
