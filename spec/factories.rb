FactoryGirl.define do
	sequence :email do 
    	"email#{rand(10000000)}@factory.com"
  	end
	


	factory :user do
		email
		password "secretpassword"
		role "photog"
	end

	factory :profile do
		first_name "user name"
		user
	end

end