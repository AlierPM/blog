class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

  def show; end
end
