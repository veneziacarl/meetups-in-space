class Meetup < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :memberships
  has_many :users, through: :memberships
end
