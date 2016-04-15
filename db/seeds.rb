# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


20.times do
  User.create!(
    username: Faker::Name.last_name + "_" + Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    bio: Faker::Hipster.paragraph
  )
end

100.times do
  Gif.create!(
    url: Giphy.random.image_url.to_s,
    description: "asdfihasd",
    user_id: rand(1..20)
  )
end
