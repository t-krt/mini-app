class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: :DESC)
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  # def post_params
  #   params.require(:post).permit(:post)
  # end
end
