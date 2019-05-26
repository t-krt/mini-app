class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @post = Post.new
    @name = user.name
    @posts = Post.includes(:user).where( user_id: params[:id] ).page(params[:page]).per(5).order(id: :DESC)
  end
end
