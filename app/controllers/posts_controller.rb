class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_post, only: [:destroy, :edit, :show]

  def index
    @post = Post.new
    @posts = Post.includes(:user).page(params[:page]).per(5).order(id: :DESC)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿が完了しました"
    else
      render "new"
    end
  end

  def edit
  end

  def show
  end

  def update
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      if @post.update(post_params)
        redirect_to root_path, notice: "編集が完了しました"
      else
        render "edit"
      end
    end
  end

  def destroy
    @post.destroy if @post.user.id == current_user.id
    redirect_to root_path, notice: "削除しました"
  end

  private
  def post_params
    params.require(:post).permit(:title, :post).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
