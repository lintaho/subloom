require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit new_user_session_path }

    it { should have_content('Sign in') }
    it { should have_content('Email')}
	it {should have_content('Password')}

	describe "with invalid information" do
    	before { click_button "Sign in" }

		it { should have_selector('div.alert', text: 'Invalid') }

		describe "flash message should go away" do 
			before {click_link "Home"}

			it { should_not have_selector('div.alert', text: 'Invalid')}
		end
    end

    describe "with valid information" do
	    let(:user) { FactoryGirl.create(:user) }

    	before do
    		fill_in "Email", with: user.email
    		fill_in "Password", with: user.password
    		click_button "Sign in"
    	end
    	it {should have_content "Signed in successfully."}

    	it {should have_link 'Profile', href: profile_path(user.profile)}
    	it {should have_link 'Sign Out', href: destroy_user_session_path}
    	it {should_not have_link 'Sign in', href: new_user_session_path}
    end


  end


end