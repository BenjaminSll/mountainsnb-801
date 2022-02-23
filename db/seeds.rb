# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'httpclient'

puts "clean DB"

Mountain.destroy_all
User.destroy_all

puts "done"
puts "seed"

User.create(email: 'admin@mountain.com', password: '123456', first_name: 'admin', last_name: 'mountain', address: Faker::Address.country, phone_number: '0123456789')

25.times do
  u = User.new(email: Faker::Internet.email, password: "123456", first_name: Faker::Name.initials(number: 2), last_name: Faker::Name.last_name, address: Faker::Address.country, phone_number: Faker::PhoneNumber.cell_phone)
  if u.save
    puts '1 new owner'
  else
    puts u.errors.messages
  end
end

15.times do
  url = "http://source.unsplash.com/collection/1705422/random"
  photo_url = URI.open(url) { |resp| resp.base_uri.to_s }


  m = Mountain.new(
    user: User.all.sample(1).first,
    name: Faker::Mountain.name,
    range: Faker::Mountain.range,
    height: rand(2000.0..8800.0),
    location: %w(Afghanistan Angola Armenia Bhutan Bolivia Canada Chile China Guatemala India Indonesia Iran Peru Russia Tanzania USA Venezuela).sample,
    terrain: Mountain::TERRAIN.sample,
    trails: rand(1..3),
    difficulty: Mountain::DIFFICULTY.sample,
    price: rand(600.00..1500.00),
    photo_url: photo_url
  )
  if m.save
    puts '1 mountain has risen'
  else
    puts m.errors.messages
  end
end

puts 'full database is ready !'
