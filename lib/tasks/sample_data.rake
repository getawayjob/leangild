namespace :db do
 desc "fill database with sample data"
 task populate: :environment do
 	admin = User.create!(first_name: "Admin", 
 				 last_name: "User",
 				 username: "admin1",
 				 password: "password",
 				 password_confirmation: "password",
 				 email: "admin1@example.com")
 	admin.toggle!(:admin)
 	Role.find_or_create_by_name({ :name => "admin" }, :without_protection => true)
 	admin.add_role :admin
 end
end