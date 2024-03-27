# Create Users
users = [
  { name: 'John Doe', email: 'john@example.com', password: 'password' },
  { name: 'Jane Smith', email: 'jane@example.com', password: 'password' },
  # Add more users as needed
]

# Create Posts
posts = [
  { title: 'First Post', content: 'This is the content of the first post.' },
  { title: 'Second Post', content: 'This is the content of the second post.' },
  # Add more posts as needed
]

# Seed Users
users.each_with_index do |user_params, index|
  unique_email = "#{user_params[:email]}#{index + 1}" # Append index to make email unique
  User.create!(user_params.merge(email: unique_email))
end

# Seed Posts associated with Users
User.all.each do |user|
  posts.each do |post_params|
    user.posts.create!(post_params)
  end
end


# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
