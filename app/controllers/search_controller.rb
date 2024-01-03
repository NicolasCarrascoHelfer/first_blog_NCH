class SearchController < ApplicationController
  def index
    puts "Searching"
    puts params[:q]
    @query = Post.ransack(params[:q])
    @posts = @query.result(distinct: true)
  end
end
