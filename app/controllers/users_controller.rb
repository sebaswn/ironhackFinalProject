class UsersController < ApplicationController
	def show
		user_id = params[:id]
		@posts = Post.where(user_id: user_id).order(created_at: :desc)
		@user = User.where(id: user_id)
	end	

	def loginOrSignUp

	end

end

