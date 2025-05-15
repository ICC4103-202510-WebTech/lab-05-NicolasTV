# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

users = 10.times.map do |i|
  User.create!(
    email: "user#{i}@example.com",
    first_name: "First#{i}",
    last_name: "Last#{i}"
  )
end

chats = 10.times.map do
  Chat.create!(
    sender_id: users.sample.id,
    receiver_id: users.sample.id
  )
end

10.times do
  Message.create!(
    chat_id: chats.sample.id,
    user_id: users.sample.id,
    body: "Este es un mensaje de prueba"
  )
end
