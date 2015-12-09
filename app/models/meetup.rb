class Meetup < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :memberships
  has_many :users, through: :memberships
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  validates :location, presence: true
  validates :creator_id, presence: true
end
