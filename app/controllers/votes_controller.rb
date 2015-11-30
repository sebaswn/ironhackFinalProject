class VotesController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
		Vote.create(post_id: params[:post_id], contest_id: params[:contest_id])
	end
	
end
