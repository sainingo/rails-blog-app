class UsersController < ApplicationController
  def index
    @users = User.includes(:posts)
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end
end
