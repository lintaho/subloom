require 'spec_helper'

describe User do

	before { @user = User.new(password: "secret1234567", email: "user@example.com") }

	subject { @user }

	it {should respond_to(:password)}
	it {should respond_to(:encrypted_password)}
	it {should respond_to(:email)}
	it {should be_valid}

	describe "when email is not present" do
		before {@user.email = " "}
		it {should_not be_valid}
	end

	describe "when password is too short" do
	    before { @user.password = "a" * 5 }
    	it { should_not be_valid }
  	end

  	describe "when email format is invalid" do
    	it "should be invalid" do
      		addresses = %w[user@df,com asfdao.org dasfkl]
	      	addresses.each do |invalid_address|
        		@user.email = invalid_address
        		expect(@user).not_to be_valid
      		end
    	end
  	end

  	describe "when email address is already taken" do
	    before do
    	  	user_with_same_email = @user.dup
      		user_with_same_email.save
    	end

    	it { should_not be_valid }
  	end

  	describe "when password is not present" do 
  		before do
  			@user2 = User.new(password:"", email:"test@test321.com")
  		end
  		it {expect(@user2).not_to be_valid}
  	end


  	
end
