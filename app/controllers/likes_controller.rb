class LikesController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
		Like.create(post_id: params[:post_id], user_id: params[:user_id])
	end

	def findLikes
		likes = Like.where(post_id: params[:id])
		render json: likes
	end
end
