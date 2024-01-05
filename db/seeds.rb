# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


5.times do
  first_name = Faker::Name.first_name
  password = "#{rand(100000..999999)}"

  User.create!(first_name: first_name, last_name: Faker::Name.last_name, email: "#{first_name}@test.com", password: password, password_confirmation: password)
end

20.times do
  Blog.create!(title: Faker::Book.title, description: Faker::Lorem.paragraphs(number: 3), user: User.find(User.ids.sample))
end
