class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[show index]

  def index
    @categories = Category.all.order(created_at: :desc)
    @posts = Post.includes(:category).all.order(created_at: :desc)
  end

  def show
    @posts = @category.posts.includes(:user, :rich_text_body).all.order(created_at: :desc)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
