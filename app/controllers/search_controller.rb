class SearchController < ApplicationController
  def index
    puts "Searching"
    puts params[:q]
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end
end
