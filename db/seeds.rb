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


5.times do |i|
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



61.times do |i|
	
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

Contest.create(name: "Monthly Contest",
					description: "A monthly Contest for Any Type of Picture",
					uploadBy: Date.yesterday,
					voteBy: Date.new(2015, 12, 7),
					endBy: Date.new(2015, 12, 8),
					cover: File.new("#{Rails.root}/app/assets/images/covers/monthly.jpg")
				)

	puts("Created Monthly Contest")
	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")
num = 0;
Post.all.each do |x|
		post_id = x.id
		post_to_look_for = Post.where(id: post_id)[0]
		user_to_look_for = User.where(id: post_to_look_for.user_id)[0]
		Contest.last.posts<<(Post.where(id: post_id))
		Contest.last.users<<(user_to_look_for)
		num = num +1
		if (num == 17)
			break;
		end
		puts("Entered post# #{num} into Montly Contest")

end

puts("----------------------------------------------------------------")
puts("----------------------------------------------------------------")

micros=["2","3","4","8","10","12","22","26","39","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60"]
Contest.create(name: "MicroPhotography",
					description: "For macrophotography Pictures. The smaller, the better.",
					uploadBy: Date.new(2015, 11, 30),
					voteBy: Date.new(2015, 11, 30),
					endBy: Date.new(2015, 12, 6),
					cover: File.new("#{Rails.root}/app/assets/images/covers/grasshopper.jpg")
				)

	puts("Created MicroPhotography Contest")
num = 0
micros.each do |x|
		post_id = x
		post_to_look_for = Post.where(id: post_id)[0]
		user_to_look_for = User.where(id: post_to_look_for.user_id)[0]
		Contest.last.posts<<(Post.where(id: post_id))
		Contest.last.users<<(user_to_look_for)
		num = num +1
		
	puts("Entered post# #{num} into MicroPhotography Contest")
	
	rand(1..30).times do |w|
		Vote.create(post_id: x,
							contest_id: Contest.last.id,
							user_id: rand(User.first.id..User.last.id))
		puts("Vote# #{w} times on post# #{num} in Flowers Contest")	
	
	end
end

	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")
Contest.create(name: "Flowers",
					description: "Everybody Loves Flowes.",
					uploadBy: Date.new(2015, 11, 30),
					voteBy: Date.new(2015, 11, 30),
					endBy: Date.new(2015, 12, 4),
					cover: File.new("#{Rails.root}/app/assets/images/covers/waterFlower.jpg")
				)

	puts("Created Flowers Contest")
num = 0
pic = 60
Post.all.each do |x|
		post_id = pic
		post_to_look_for = Post.where(id: post_id)[0]
		user_to_look_for = User.where(id: post_to_look_for.user_id)[0]
		Contest.last.posts<<(Post.where(id: post_id))
		Contest.last.users<<(user_to_look_for)
		num = num +1
		if num == 1
			break
		end
	puts("Entered post# #{num} into Abstract Contest")

		rand(1..30).times do |w|
			Vote.create(post_id: pic,
								contest_id: Contest.last.id,
								user_id: rand(User.first.id..User.last.id))
			puts("Vote# #{w} times on post# #{num} in Abstract Contest")	
	
	end
end






	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")
Contest.create(name: "Weekly",
					description: "Weekly competition for any of your pictures.",
					uploadBy: Date.new(2015, 11, 30),
					voteBy: Date.new(2015, 11, 30),
					endBy: Date.new(2015, 12, 1),
					cover: File.new("#{Rails.root}/app/assets/images/covers/cats.jpg")
				)

	puts("Created Weekly Contest")
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
	puts("Entered post# #{num} into Weekly Contest")
	Contest.last.posts.each do |z|
		rand(1..30).times do |w|
			Vote.create(post_id: z.id,
								contest_id: Contest.last.id,
								user_id: rand(User.first.id..User.last.id))
			puts("Vote# #{w} times on post# #{num} in Weekly Contest")	
		end
	end
end

	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")




	puts("----------------------------------------------------------------")
	puts("----------------------------------------------------------------")

	
