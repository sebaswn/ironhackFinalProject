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
					password: "password",
					username: Faker::Internet.user_name)
	puts("count: #{i}")
end
User.create(email: "sebas@fishtank.h20",
	password: "password", 
	username: "sebas")
	puts("Created Admin User")
	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")

images= ["http://animalia-life.com/data_images/dog/dog1.jpg", "http://weknowyourdreams.com/images/dog/dog-07.jpg", "http://www.surprisingitaly.com/wp-content/uploads/2015/03/Venezia-tourism-guide.jpg", "https://static.pexels.com/photos/909/flowers-garden-colorful-colourful.jpg", "http://www.bitrebels.com/wp-content/uploads/2011/06/Bugs-Life-Up-Close-3.jpg"]


50.times do |i|
	Post.create( name: Faker::Team.name, 
					location: Faker::Address.city, 
					description: Faker::Lorem.sentence, 
					user_id: rand(User.first.id..User.last.id))
	puts("count: #{i}")
end
	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")
