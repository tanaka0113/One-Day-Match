class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.published.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.expires_on = Date.today

    if @post.save
      redirect_to posts_path, notice: "保存しました"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])

    if @post.draft?
      redirect_to edit_post_path(@post),
        alert: "この記録はまだ下書きです"
      return
    end

    @comments = @post.comments
    @comment = Comment.new
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path, notice: "保存しました"
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "削除しました"
  end
  
  def drafts
    @posts = current_user.posts.draft.order(created_at: :desc)
  end
  
  private
  

  private

  def post_params
    params.require(:post).permit(:content, :image, :status)
  end
end
