class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }

  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  def self.from_users_followed_by(user)

    # followed_user_ids is known by ActiveRecord b/c of the 
    # has_many :followed_users association
    # just need to append _id to get all the ids of the 
    # user.followed_users collection
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
           user_id: user.id)
  end
end
