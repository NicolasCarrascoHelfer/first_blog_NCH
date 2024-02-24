class PopulateUserPostsCount < ActiveRecord::Migration[7.1]
  def change
    User.all.each do |user|
      User.reset_counters(user.id, :posts)
    end
  end
end
