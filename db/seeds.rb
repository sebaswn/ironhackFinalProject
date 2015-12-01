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


10.times do |i|
	User.create(email: Faker::Internet.email, 
					password: "password",
					username: Faker::Internet.user_name,
					avatar: File.new("#{Rails.root}/app/assets/images/avatars/#{i}.jpg"))
	puts("User# #{i}")
end
User.create(email: "sebas@fishtank.h20",
	password: "password", 
	username: "sebas",
	avatar: File.new("#{Rails.root}/app/assets/images/avatars/sebas.jpg"),
	role: "mod")
	puts("Created Admin User")
	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")


45.times do |i|
	
	Post.create( name: Faker::Team.name, 
					location: Faker::Address.city, 
					description: Faker::Lorem.paragraph, 
					user_id: rand(User.first.id..User.last.id),
					coordinateX: Faker::Address.longitude.to_f,
					coordinateY: Faker::Address.latitude.to_f,
					image: File.new("#{Rails.root}/app/assets/images/seed/#{i}.jpg")
					)
	puts("Post# #{i}")

	rand(1..50).times do |y|
		Like.create(user_id: rand(User.first.id..User.last.id),
								post_id: Post.last.id)
		puts("Like# #{y} for Post# #{i}")
	end
	rand(0..10).times do |v|
		Comment.create(user_id: rand(User.first.id..User.last.id),
						post_id: Post.last.id,
						content: Faker::Lorem.sentence)
		puts("comment# #{v} for Post# #{i}")

	end
		
end


	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")

Contest.create(name: "MicroPhotography",
					description: "For macrophotography pictures. The smaller, the beter.",
					uploadBy: Date.today,
					voteBy: Date.tomorrow,
					endBy: Date.new(2015, 12, 3),
					cover: File.new("#{Rails.root}/app/assets/images/covers/grasshopper.jpg")
				)

	puts("Created MicroPhotography Contest")
	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")

Contest.create(name: "Flowers",
					description: "Flowers of all shapes colers and sizes.",
					uploadBy: Date.yesterday,
					voteBy: Date.today,
					endBy: Date.new(2015, 12, 2),
					cover: File.new("#{Rails.root}/app/assets/images/covers/flower.jpg")
				)

	puts("Created Flowers Contest")
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
	puts("Entered post# #{num} into Flowers Contest")
	Contest.last.posts.each do |z|
		rand(1..30).times do |w|
			Vote.create(post_id: z.id,
								contest_id: Contest.last.id,
								user_id: rand(User.first.id..User.last.id))
			puts("Vote# #{w} times on post# #{num} in Flowers Contest")	
		end

	end
end

	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")




	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")

	
