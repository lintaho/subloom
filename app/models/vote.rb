class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :link
	validates :user_id, presence: true, :uniqueness => {:scope => :link_id}
	validates :link_id, presence: true
end
