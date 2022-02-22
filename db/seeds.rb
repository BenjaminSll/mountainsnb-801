# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seeding database..."

25.times do
  u = User.new(email: Faker::Internet.email, password: Faker::Alphanumeric.alpha(number: 10), first_name: Faker::Name.initials(number: 2), last_name: Faker::Name.last_name, address: Faker::Address.country, phone_number: Faker::PhoneNumber.cell_phone)
  if u.save
    puts '1 new owner'
  else
    puts u.errors.messages
  end
end

27.times do
  m = Mountain.new(user_id: rand(1..25), name: Faker::Mountain.name, range: Faker::Mountain.range, height: rand(2000.0..8800.0), location: %w(Afghanistan Angola Armenia Bhutan Bolivia Canada Chile China Guatemala India Indonesia Iran Peru Russia Tanzania USA Venezuela).sample, terrain: %w(rock forest ice).sample, trails: rand(1..3), difficulty: ['health walk', 'breath breaker', 'sunday jogging', 'for olympic athletes and astronauts'].sample, price: rand(600.00..1500.00))
  if m.save
    puts '1 mountain has risen'
  else
    puts m.errors.messages
  end
end

puts 'full database !'
