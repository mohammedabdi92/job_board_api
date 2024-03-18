# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create!(
  email: 'abadi.admin@gmail.com',
  password: 'P@ssw0rd',
  password_confirmation: 'P@ssw0rd',
  role: 'admin'
)

User.create!(
  email: 'abadi.user1@gmail.com',
  password: 'P@ssw0rd',
  password_confirmation: 'P@ssw0rd',
  role: 'job_seeker'
)
User.create!(
  email: 'abadi.user2@gmail.com',
  password: 'P@ssw0rd',
  password_confirmation: 'P@ssw0rd',
  role: 'job_seeker'
)

puts "Seed data created successfully"