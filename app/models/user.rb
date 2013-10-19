class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :links
  has_many :votes
  has_one :profile, :dependent => :destroy
  after_create :create_profile

  ROLES = %w[photog user]


 	def create_profile
 		# debugger
  		profile = Profile.create(:user_id => self.id)
  	end
  
end
