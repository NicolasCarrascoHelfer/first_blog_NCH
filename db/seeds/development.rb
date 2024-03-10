puts "Seeding development database..."

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

uncat = Category.create(name: "Uncategorized")

admin = User.create(email: "admin@example.com", first_name: "Ad", last_name: "Min", password: "admin123", password_confirmation: "admin123", role: User.roles[:admin])

auser = User.create(email: "user@example.com", first_name: "Us", last_name: "Er", password: "user123", password_confirmation: "user123")

adad = Address.create(street: "Admin's Home", city: "Mintown", state: "AM", zip: "12345", country: "Adminland", user: admin)

usad = Address.create(street: "User's Home", city: "Usertown", state: "US", zip: "54321", country: "Userland", user: auser)

admin.update(address_id: adad.id)

auser.update(address_id: usad.id)

5.times do |x|
  post = Post.create(title: "Title #{x}", body: "Body #{x} filled", user_id: admin.id)
  3.times do |y|
    Comment.create(body: "Comment #{y}", user_id: auser.id, post_id: post.id)
  end
  3.times do |y|
    Comment.create(body: "Comment #{y + 3}", user_id: admin.id, post_id: post.id)
  end
end

5.times do |x|
  post = Post.create(title: "Title #{x + 5}", body: "Body #{x + 5} filled", user_id: auser.id)
  3.times do |y|
    Comment.create(body: "Comment #{y}", user_id: auser.id, post_id: post.id)
  end
  3.times do |y|
    Comment.create(body: "Comment #{y + 3}", user_id: admin.id, post_id: post.id)
  end
end
