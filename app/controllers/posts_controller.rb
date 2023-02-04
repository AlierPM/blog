class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find_by(id: params[:post_id])
  end

  # GET /posts/new
  def new
    @new_post = Post.new
  end

  # POST /posts
  # POST /posts.json
  # def create
  #   @post = Post.new(post_params)
  #   @post.user = current_user

  #   respond_to do |format|
  #     if @post.save
  #       format.html { redirect_to @post, notice: 'Post was successfully created.' }
  #       format.json { render :show, status: :created, location: @post }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @post = Post.new(post_params)
    current_user.posts_counter += 1
    current_user.save
    @post.user = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      redirect_to "/users/#{current_user.id}/posts"
    else
      render :new
    end
  end

  # GET /posts/1/edit
  def edit; end

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
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    # params.require(:new_post).permit(:title, :content, :user_id)
    params.require(:new_post).permit(:title, :content)
  end

  def require_same_user
    return unless current_user != @post.user

    flash[:danger] = 'You can only edit or delete your own posts'
    redirect_to root_path
  end
end