# require 'spec_helper'
# require 'ruby-debug'

# describe "Profile pages" do

# 	subject{ page }
	
# 	before {@user = User.new(email:"test@testtest.com", password:"123123123")}


# 	describe "profile page" do

# 		let(:profile) {FactoryGirl.create(:profile, user: @user)}
# 		before { visit profile_path(profile.id) }
# 		# debugger
# 		it {should have_content(profile.user.email)}
# 		it {should have_content('Photographer')}
# 		#                        
# 		# it {should have_content("Edit profile")}
# 	end

# 	describe "edit page" do
# 		let(:profile) {FactoryGirl.create(:profile, user: @user)}
# 		before { visit edit_profile_path(profile)}

# 		describe "has correct content" do
# 			it {should have_content "Update Profile"} 
# 		end

# 		# describe "with invalid information" do
#   #     		before { click_button "Save changes" }

#   #     		it { should have_content('error') }
#   #   	end
#   describe "with valid information" do
#   	before do
#   		fill_in "First name:", with: "First namey"
#   		fill_in "Last name:", with: "Last namey"
#   		select_date('11/11/2001', :from => 'Birth date:')
#   		click_button "Save changes"
#   	end

#   	it {should have_content("Profile updated") }
#   	specify { expect(profile.reload.first_name).to  eq "First namey" }
#   	specify { expect(profile.reload.last_name).to  eq "Last namey" }
#   end

#   describe "submitting to the update action" do
#   	before { patch profile_path(profile) }
#   	specify { expect(response).to redirect_to(new_user_session_path) }
#   end


# end
# end