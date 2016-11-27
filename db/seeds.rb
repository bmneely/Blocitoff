require 'faker'

10.times do
    User.create!(
        email: Faker::Internet.email,
        password: Faker::Internet.password,
    )
end

User.create(
    email: "hello@user.com",
    password: "Password1"
)

users = User.all

25.times do
    Item.create!(
        user: users.sample,
        name: Faker::Lorem.sentence
    )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
