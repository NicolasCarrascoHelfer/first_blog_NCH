class AddPostCounterCacheToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :posts_count, :integer
  end
end