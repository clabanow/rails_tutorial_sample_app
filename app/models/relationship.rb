class Relationship < ActiveRecord::Base
  # Rails infers the names of the foreign keys (follower_id from :follower)
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
