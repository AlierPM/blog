class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @user = Post.first
  end
end
