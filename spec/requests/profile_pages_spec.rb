require 'spec_helper'
require 'ruby-debug'

describe "Profile pages" do

	subject{ page }

	describe "profile page" do
		let(:profile) {FactoryGirl.create(:profile)}
		before { visit profile_path(profile) }

		it {should have_content(profile.user.email)}
		it {should have_content('Welcome')}
		# debugger
		it {should have_link("Edit profile")}
	end

end