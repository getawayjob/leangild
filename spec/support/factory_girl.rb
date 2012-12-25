RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  factory :user do
    first_name "Firstname"
    last_name "Lastname"
    username  "username"
    email     "email@example.com"
    password "password"
    password_confirmation "password"

    factory :admin do
    	admin true 
    end
  end
   
   factory :startup do
     name "Startup"
     pitch "Pitch"
     website "website.com"
     user
   end
  end   
