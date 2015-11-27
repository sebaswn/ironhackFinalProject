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


20.times do |i|
	User.create(email: Faker::Internet.email, 
					password: "password",
					username: Faker::Internet.user_name)
	puts("User# #{i}")
end
User.create(email: "sebas@fishtank.h20",
	password: "password", 
	username: "sebas",
	role: "mod")
	puts("Created Admin User")
	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")


2.times do |i|
	
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
4.times do |i|
	Contest.create(name: Faker::Team.name,
					description: Faker::Lorem.sentence,
					uploadBy: Date.new(2015, 11, rand(26..28)),
					voteBy: Date.new(2015, 11, rand(29..30)),
					endBy: Date.new(2015, 12, rand(1..4))
				)
	5.times do |x|
		post_id = rand(Post.first.id..Post.last.id)
		post_to_look_for = Post.where(id: post_id)[0]
		user_to_look_for = User.where(id: post_to_look_for.user_id)[0]
		Contest.last.posts<<(Post.where(id: post_id))
		Contest.last.users<<(user_to_look_for)
	end

	puts("Contest# #{i}")
end

Contest.create(name: "Starts Today",
					description: Faker::Lorem.sentence,
					uploadBy: Date.new(2015, 11, 27),
					voteBy: Date.new(2015, 11, 29),
					endBy: Date.new(2015, 12, 30)
				)

Contest.create(name: "Started Yesterday",
					description: Faker::Lorem.sentence,
					uploadBy: Date.new(2015, 11, 26),
					voteBy: Date.new(2015, 11, 29),
					endBy: Date.new(2015, 12, 30)
				)

Contest.create(name: "Voting Open",
					description: Faker::Lorem.sentence,
					uploadBy: Date.new(2015, 11, 26),
					voteBy: Date.new(2015, 11, 27),
					endBy: Date.new(2015, 12, 30)
				)

Contest.create(name: "Voting Still Open",
					description: Faker::Lorem.sentence,
					uploadBy: Date.new(2015, 11, 24),
					voteBy: Date.new(2015, 11, 27),
					endBy: Date.new(2015, 12, 30)
				)




	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")

	
