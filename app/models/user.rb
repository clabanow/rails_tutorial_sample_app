class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy

  # uses followed_id in the relationships table to assemble an array
  # could also say => has_many :followeds, through: :relationships
  has_many :followed_users, through: :relationships, source: :followed

  # must include class name else Rails would search for reverse_rel table
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

	before_save { self.email = email.downcase }
  before_create :create_remember_token

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, 
					  format: { with: VALID_EMAIL_REGEX },
					  uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }

	# this auto adds presence valiations for pw and its confirmation
	has_secure_password

  def feed
    # the ? ensures that the id is properly escaped before being
    # included in the underlying SQL query
    # Micropost.where("user_id = ?", id)

    Micropost.from_users_followed_by(self)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    # could also be written => self.relationships.create!...
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by!(followed_id: other_user.id).destroy
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end

end
