class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.where(expires_on: Date.today)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.expires_on = Date.today

    if @post.save
      redirect_to posts_path, notice: "投稿しました"
    else
      render :new
    end
  end

  # 👇 これを追加
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end
  

  private

  def post_params
    params.require(:post).permit(:content, :image)
  end
  
end
