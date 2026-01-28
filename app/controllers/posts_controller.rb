class PostsController < ApplicationController
  def index
    @posts = Post.where(expires_on: Date.today)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.expires_on = Date.today

    if @post.save
      redirect_to posts_path, notice: "投稿しました"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
