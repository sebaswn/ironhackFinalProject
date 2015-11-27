	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")
	puts("Destroying Users")
	User.destroy_all
	puts("Destroying Posts")
	Post.destroy_all
	puts("Destroying Contests")
	Contest.destroy_all

	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")


2.times do |i|
	User.create(email: Faker::Internet.email, 
					password: "password",
					username: Faker::Internet.user_name)
	puts("User# #{i}")
end
User.create(email: "sebas@fishtank.h20",
	password: "password", 
	username: "sebas")
	puts("Created Admin User")
	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")


42.times do |i|
	
	Post.create( name: Faker::Team.name, 
					location: Faker::Address.city, 
					description: Faker::Lorem.sentence, 
					user_id: rand(User.first.id..User.last.id),
					image: File.new("#{Rails.root}/app/assets/images/seed/#{i}.jpg")
					)
	
	puts("Post# #{i}")
end
	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")
2.times do |i|
	Contest.create(name: Faker::Team.name,
					description: Faker::Lorem.sentence,
					uploadBy: Date.new(2015, 10, 27, 22),
					voteBy: Date.new(2015, 10, 28, 22),
					endBy: Date.new(2015, 10, 29, 22)
				)
	rand(5..10).times do |x|
		Contest.last.posts<<(Post.where(id: rand(Post.first.id..Post.last.id)))
	end

	puts("Contest# #{i}")
end
	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")

	
