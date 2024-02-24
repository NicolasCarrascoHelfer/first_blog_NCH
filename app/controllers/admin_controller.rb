class AdminController < ApplicationController
  def index
  end

  def posts
    @posts = Post.all.includes(:user)
  end

  def comments
    @comments = Comment.all.includes(:user, :post, :rich_text_body)
  end

  def users
    @users = User.all
  end

  def show_post
    @post = Post.includes(:user, :comments).find(params[:id])
  end
end
