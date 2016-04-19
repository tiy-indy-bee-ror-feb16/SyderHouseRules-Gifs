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

20.times do |i|
  array = (1..100).to_a
  50.times do
    Vote.create!(
      vote: true,
      voteable_id: array.delete(array.sample),
      voteable_type: 'Gif',
      voter_id: i,
      voter_type: 'User'
    )
  end
end

tags = %w(#funny #awesome #super #neato #nifty #silly #stupendous #inane)
200.times do
  gif = Gif.find(rand(1..100))
  gif.tag_list.add(tags.sample)
  gif.save
end
