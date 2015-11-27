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


46.times do |i|
	i.to_s()
	Post.create( name: Faker::Team.name, 
					location: Faker::Address.city, 
					description: Faker::Lorem.sentence, 
					user_id: rand(User.first.id..User.last.id),
					image: File.new("#{Rails.root}/app/assets/images/seed/#{i}.jpg")
					)
	
	puts("count: #{i}")
end
	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")

	
