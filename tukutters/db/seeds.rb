100.times do |n|
  content = Faker::Games::Pokemon.name
  Tukutter.create!(content: content)
end
