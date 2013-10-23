require 'spec_helper'

describe "User pages" do

	describe "register page" do
		before { visit new_user_registration_path }
		subject{ page }

		it { should have_content('Sign up') }
		it { should have_content('Email')}
		it {should have_content('Password')}
		it {should have_content('Password confirmation')}
		it {should have_button('Sign up')}
	end

	describe "sign up" do 
		before {visit new_user_registration_path}
		let (:submit) {"Sign up"}
		let (:email){"kfdjasfklj@fdkljafl.com"}

		describe "with bad info" do 
			it "should not create a user" do
				expect{click_button submit}.not_to change(User, :count)
			end

			describe "after saving the info" do
				before {click_button submit}
				
				it { expect(page).to have_content("error") }
			end
		end

		describe "with good info" do
			before do
				fill_in "Email", with: email
				fill_in "Password", with: "123123123"
				fill_in "Password confirmation", with: "123123123"
			end

			it "should make a user" do
				expect{click_button submit}.to change(User, :count).by(1)
			end

			describe "after saving the info" do
				before {click_button submit}
				
				let(:user) {User.find_by(email: email)}	
				it { expect(page).to have_content(user.email) }
			end
		end
	end

end