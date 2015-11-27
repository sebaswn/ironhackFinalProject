class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  before_filter do 
    redirect_to :users_registration unless current_user
  end

  def getPostInfo
    chosenPost = Post.find(params[:id])
    render json: chosenPost
  end

 
  # GET /posts
  # GET /posts.json
  def index
    user_id = params[:user_id]
    @posts = Post.where(user_id: user_id)
  end

  def showAll
    @posts = Post.all.order(created_at: :desc)
  end

  def showRandom
    @posts = Post.order("RANDOM()").limit(Post.count)
  end

 

  # GET /posts/1
  # GET /posts/1.json
  def show
    id = params[:id]
    @post = Post.find_by(id: id)
  end


  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params, user_id: current_user.id)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_showAll_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_showAll_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:name, :description, :location, :picture, :user_id, :image)
    end
end
