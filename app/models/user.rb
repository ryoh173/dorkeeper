class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  mount_uploader :image, ImagesUploader

  has_many :relationships, dependent: :destroy
  has_many :relationship_events, through: :relationships, source: :event

  #指定のイベントに参加登録する
  def follow!(other_event)
    relationships.create!(event_id: other_event.id)
  end

  #参加登録しているかどうかを確認する
  def following?(other_event)
    relationships.find_by(event_id: other_event.id)
  end

  def unfollow!(other_event)
  relationships.find_by(event_id: other_event.id).destroy
  end
end
