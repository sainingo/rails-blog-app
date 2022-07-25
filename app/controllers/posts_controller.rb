class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = current_user
    add_post = @post.posts.new(post_params)
    add_post.comments_counter = 0
    add_post.likes_counter = 0
    respond_to do |format|
      format.html do
        if add_post.save
          flash[:success] = 'Post created successfully'
          redirect_to user_posts_url
        else
          flash.now[:error] = 'Error: Post could not be created'
          render :new, locals: { post: add_post }
        end
      end
    end
  end

  private

  def post_params
    params.require(:new_post).permit(:title, :text)
  end
end
