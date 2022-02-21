# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seeding database..."
27.times do
  Mountain.create(name: Faker::Mountain.name, range: Faker::Mountain.range, height: rand(2000.0..8800.0), location: %w(Afghanistan Angola Armenia Bhutan Bolivia Canada Chile China Guatemala India Indonesia Iran Peru Russia Tanzania USA Venezuela).sample, terrain: %w(rock forest ice).sample, trails: rand(1..3), difficulty: ['health walk', 'breath breaker', 'sunday jogging', 'only for sherpas and astronauts'].sample, price: rand(600.00..1500.00))
  puts '1 mountain has risen'
end

puts 'full database !'
