# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
user1 = User.create(name: "John Doe", email: "john@example.com")
user2 = User.create(name: "Jane Smith", email: "jane@example.com")

group1 = Group.create(name: "Ruby Group", description: "A group for Ruby enthusiasts")
group2 = Group.create(name: "Rails Group", description: "A group for Rails developers")

user1.groups << group1
user2.groups << group1
user2.groups << group2

Post.create(content: "Hello Ruby!", user: user1, group: group1)
Post.create(content: "Hello Rails!", user: user2, group: group2)
