class Event < ActiveRecord::Base
  belongs_to :user
  has_many :relationships, dependent: :destroy
  has_many :relationship_users, through: :relationships, source: :user

  validates :title, presence: true
  validates :content, presence: true
end
