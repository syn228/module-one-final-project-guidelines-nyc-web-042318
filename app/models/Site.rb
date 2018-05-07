class Site < ActiveRecord::Base
  belongs_to :usersite
  has_many :users, through: :usersite
  belongs_to :city
end
