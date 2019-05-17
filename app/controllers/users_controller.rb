class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @posts = Post.includes(:user).page(params[:page]).per(5).order(id: :DESC)
  end
end
