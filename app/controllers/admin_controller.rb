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

  def categories
    @categories = Category.all
  end

  def show_post
    @post = Post.includes(:user, comments: [:user, :rich_text_body]).find(params[:id])
  end
end
