class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :DESC)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path, notice: "投稿が完了しました"
    binding.pry
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :post).merge(user_id: params[:user_id])
  end
end
