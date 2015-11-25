class UsersController < ApplicationController


	before_filter do 
    	redirect_to :users_registration unless current_user
  	end 


	def show
		user_id = params[:id]
		@posts = Post.where(user_id: user_id).order(created_at: :desc)
		@user = User.where(id: user_id)
	end	

	

end

