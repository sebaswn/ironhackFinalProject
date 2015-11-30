	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")
	puts("Destroying Posts")
	Post.destroy_all
	puts("Destroying Contests")
	Contest.destroy_all
	puts("Destroying Votes")
	Vote.destroy_all
	puts("Destroying Likes")
	Like.destroy_all
	puts("Destroying Users")
	User.destroy_all
	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")


200.times do |i|
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


45.times do |i|
	
	Post.create( name: Faker::Team.name, 
					location: Faker::Address.city, 
					description: Faker::Lorem.paragraph, 
					user_id: rand(User.first.id..User.last.id),
					image: File.new("#{Rails.root}/app/assets/images/seed/#{i}.jpg")
					)
	puts("Post# #{i}")

	rand(1..10).times do |y|
		Like.create(user_id: rand(User.second.id..User.last.id),
								post_id: Post.last.id)
		puts("Like# #{y} for Post# #{i}")
	end
		
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
					endBy: Date.new(2015, 11, 30)
				)

Contest.create(name: "Started Yesterday",
					description: Faker::Lorem.sentence,
					uploadBy: Date.new(2015, 11, 26),
					voteBy: Date.new(2015, 11, 29),
					endBy: Date.new(2015, 11, 30)
				)

Contest.create(name: "Voting Open",
					description: Faker::Lorem.sentence,
					uploadBy: Date.new(2015, 11, 26),
					voteBy: Date.new(2015, 11, 30),
					endBy: Date.new(2015, 12, 01)
				)
Post.all.each do |x|
		post_id = x.id
		post_to_look_for = Post.where(id: post_id)[0]
		user_to_look_for = User.where(id: post_to_look_for.user_id)[0]
		Contest.last.posts<<(Post.where(id: post_id))
		Contest.last.users<<(user_to_look_for)
	end

Contest.create(name: "Voting Still Open",
					description: Faker::Lorem.sentence,
					uploadBy: Date.new(2015, 11, 24),
					voteBy: Date.new(2015, 11, 27),
					endBy: Date.new(2015, 11, 30)
				)
num = 0
Post.all.each do |x|
		post_id = x.id
		post_to_look_for = Post.where(id: post_id)[0]
		user_to_look_for = User.where(id: post_to_look_for.user_id)[0]
		Contest.last.posts<<(Post.where(id: post_id))
		Contest.last.users<<(user_to_look_for)
		num = num +1
		if num == 17
			break
		end
	end

Contest.create(name: "Finished",
					description: Faker::Lorem.sentence,
					uploadBy: Date.new(2015, 11, 24),
					voteBy: Date.new(2015, 11, 27),
					endBy: Date.new(2015, 11, 29)
				)
num = 0
Post.all.each do |x|
		post_id = x.id
		post_to_look_for = Post.where(id: post_id)[0]
		user_to_look_for = User.where(id: post_to_look_for.user_id)[0]
		Contest.last.posts<<(Post.where(id: post_id))
		Contest.last.users<<(user_to_look_for)
		num = num +1
		if num == 17
			break
		end
		
	end
Contest.last.posts.each do |z|
	rand(1..30).times do |w|
		Vote.create(post_id: z.id,
							contest_id: Contest.last.id,
							user_id: rand(User.first.id..User.last.id))
	end
end



	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")

	
