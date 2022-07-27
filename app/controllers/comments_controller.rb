class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    post = Post.find(params[:id])
    comment = current_user.comments.new(comment_params)
    comment.post = post
    if comment.save!
      flash[:success] = 'Your comment was added'
    else
      flash[:error] = 'Your comment was not added'
    end
    redirect_to user_post_path
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:success] = 'Your comment was deleted'
    redirect_to root_url
  end

  private

  def comment_params
    params.permit(:text)
  end
end
