namespace :db do
 desc "fill database with sample data"
 task populate: :environment do
 	admin = User.create!(first_name: "Raymond", 
 				 last_name: "Cudjoe",
 				 username: "rkcudjoe",
 				 password: "password",
 				 password_confirmation: "password",
 				 email: "rkcudjoe@example.com")
 	admin.toggle!(:admin)
 	Role.find_or_create_by_name({ :name => "admin" }, :without_protection => true)
 	admin.add_role :admin

 	5.times do |n|
 		first_name = Faker::Name.first_name
 		last_name = Faker::Name.last_name
 		email = "username-#{ n + 1}@example.com"
 		username = "username_#{ n + 1}"
 		password = "password"
 		User.create!(first_name: first_name,
 					 last_name: last_name,
 					 email: email,
 					 username: username,
 					 password: password,
 					 password_confirmation: password)
   end
 end
end