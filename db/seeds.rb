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


