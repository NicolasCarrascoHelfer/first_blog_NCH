class SearchController < ApplicationController
  def index
    puts "Searching"
    puts params[:q]
    @query = Post.includes(:user, :rich_text_body).ransack(params[:q])
    @posts = @query.result(distinct: true)
  end
end
