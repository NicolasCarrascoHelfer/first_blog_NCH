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

  def new
    @category = Category.new
  end

  def edit

  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: "Category was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to admin_categories_path, notice: "Category was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
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
