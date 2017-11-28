class Event < ActiveRecord::Base
  has_many :users
  has_many :relationships, dependent: :destroy
  has_many :relationship_users, through: :relationships, source: :user
end
