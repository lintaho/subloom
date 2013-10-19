class Profile < ActiveRecord::Base
	belongs_to :user
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png", :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
		:url => "/system/:attachment/:id/:style/:filename"
end
