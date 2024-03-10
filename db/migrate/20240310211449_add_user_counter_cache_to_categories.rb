class AddUserCounterCacheToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :users_count, :integer
  end
end
