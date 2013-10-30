class Link < ActiveRecord::Base
	belongs_to :user
	has_many :votes
	validates :user_id, presence: true
	has_many :save_relationships, foreign_key: "link_id", dependent: :destroy
	has_many :users_who_saved, through: :save_relationships, source: :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "profile_default.png", :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
		:url => "/system/:attachment/:id/:style/:filename"
	
end
