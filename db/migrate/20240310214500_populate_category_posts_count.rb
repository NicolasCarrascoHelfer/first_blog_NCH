class PopulateCategoryPostsCount < ActiveRecord::Migration[7.1]
  def change
    Category.all.each do |category|
      Category.reset_counters(category.id, :posts)
    end
  end
end
