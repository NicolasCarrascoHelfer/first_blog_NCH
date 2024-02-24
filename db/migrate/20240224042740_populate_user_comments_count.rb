class PopulateUserCommentsCount < ActiveRecord::Migration[7.1]
  def change
    User.all.each do |user|
      User.reset_counters(user.id, :comments)
    end
  end
end
