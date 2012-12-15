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
   end
 end   
