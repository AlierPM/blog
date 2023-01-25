class CommentsController < ApplicationController
  def new
    @new_comment = Comment.new
  end

  def create
    @comment = Comment.new(post_params)
    @comment.user = current_user
    p 'Hi ZikaZaki'
    current_post = Post.find_by(id: params[:post_id])
    p current_post
    @comment.post = current_post
    if @comment.save
      current_post.comments_counter += 1
      current_post.save
      redirect_to "/users/#{current_user.id}/posts/#{params[:post_id]}"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:new_comment).permit(:content)
  end
end
