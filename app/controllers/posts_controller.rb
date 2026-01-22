class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
  
    def index
      @posts = Post.where(expires_on: Date.today)
    end
  
    def show
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
  
    def edit
    end
  
    def update
      if @post.update(post_params)
        redirect_to post_path(@post), notice: "更新しました"
      else
        render :edit
      end
    end
  
    def destroy
      @post.destroy
      redirect_to posts_path, notice: "削除しました"
    end
  
    private
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :body)
    end
  end
  