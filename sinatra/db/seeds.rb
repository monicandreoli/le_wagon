require "faker"

10.times do
  Restaurant.create!(
    name: Faker::Coffee.blend_name,
    city: Faker::GameOfThrones.city
  )
end
