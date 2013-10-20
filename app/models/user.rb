class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :links
  has_many :votes
  has_one :profile, :dependent => :destroy
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",       :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"

  has_many :follow_relationships, foreign_key: "follower_id", :dependent => :destroy
  has_many :followed_users, through: :follow_relationships, source: :followed
  
  has_many :reverse_follow_relationships, foreign_key: "followed_id", class_name: "FollowRelationship", dependent: :destroy
  has_many :followers, through: :reverse_follow_relationships, source: :follower

  after_create :create_profile

  ROLES = %w[photog user]

  def following?(other_user)
    follow_relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    follow_relationships.create(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    follow_relationships.find_by(followed_id: other_user.id).destroy!
  end

 	def create_profile
 		# debugger
  		profile = Profile.create(:user_id => self.id)
  	end
  
end
