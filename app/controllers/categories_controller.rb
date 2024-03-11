class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show create update destroy ]
  before_action :authenticate_user!, except: %i[show index]

  def index
    @categories = Category.all.order(created_at: :desc)
    @posts = Post.includes(:category).all.order(created_at: :desc)
  end

  def show
    @posts = @category.posts.includes(:user, :rich_text_body).all.order(created_at: :desc)
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category has been created"
      redirect_to category_path(@category)
    else
      flash[:notice] = "Category has not been created"
      redirect_to category_path(@category)
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_category
    @category = Category.find(params[:id])

    if params[:id] != @category.slug
      return redirect_to @category, :status => :moved_permanently
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
