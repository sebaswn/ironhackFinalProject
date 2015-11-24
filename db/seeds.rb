	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")
	puts("Destroying Users")
	User.destroy_all
	puts("Destroying Posts")
	Post.destroy_all





	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")

10.times do |i|
	User.create(email: Faker::Internet.email, 
					password: "password")
	puts("count: #{i}")
end
User.create(email: "sebas@fishtank.h20",
	password: "password")
	puts("Created Admin User")
	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")

50.times do |i|
	Post.create( name: Faker::Team.name, 
					location: Faker::Address.city, 
					description: Faker::Lorem.sentence, 
					picture: Faker::Avatar.image,
					user_id: rand(User.first.id..User.last.id))
	puts("count: #{i}")
end
	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")
