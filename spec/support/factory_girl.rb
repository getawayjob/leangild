RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  factory :user do
    username  "username"
    email     "email@example.com"
    password "password"
    #password_confirmation "password"

    factory :admin do
    	admin true 
    end
  end
   
   factory :startup do
     name "Startup"
     pitch "Pitch"
     website "website.com"
     tagline "tagline"
     user
   end

   factory :update do
   	 content "update"
   	 startup
   	end
  end   
