class UsersController < ApplicationController
  def show
    @name = current_user.name
    @posts = Post.includes(:user).page(params[:page]).per(5).order(id: :DESC)
  end
end
