# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.destroy_all
Event.destroy_all
OrgMembership.destroy_all
User.destroy_all
Organization.destroy_all

# 20.times do
#   Organization.create(
#   {name: Faker::Company.name, website: Faker::Internet.url, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone: Faker::PhoneNumber.phone_number, password: 'pass123', address: "#{Faker::Address.city} #{Faker::Address.street_name} #{Faker::Address.street_address}" }
#   )
# end

Organization.create([
  {name: 'Retirement Concepts Seniors Services Ltd', address: '1090 W Georgia St, Vancouver, BC V6E 3V7
', website: 'retirementconcepts.com', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone: Faker::PhoneNumber.phone_number, password: 'pass123' },
  {name: 'Canadian In-Home Care Assistance Inc.', address: '852 Seymour St, Vancouver, BC V6B 3L6
', website: 'canadianinhomecare.ca', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone: Faker::PhoneNumber.phone_number, password: 'pass123'},
{name: 'Arbutus Care Centre', address: '4505 Valley Dr, Vancouver, BC V6L 2L1', website: 'reveraliving.com', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone: Faker::PhoneNumber.phone_number, password: 'pass123'},
{name: 'Success', address: '555 Carrall St, Vancouver, BC V6B 2J8', website: 'successbc.car', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone: Faker::PhoneNumber.phone_number, password: 'pass123'},

  {name: 'CodeCore', address: '142 W Hastings St, Vancouver, BC V6B 1G8', website: 'https://codecore.ca/', first_name: 'Farshid', last_name: 'HM', email: 'admin@admin.com', password: 'pass123', phone: Faker::PhoneNumber.phone_number}

  ])

7.times do
  User.create({ first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, age: rand(16..40), password: 'pass123'})
end

me = User.create({first_name: 'Freddy', last_name: 'HM', email: 'admin@admin.com', age: 29, password: 'pass123', bio: Faker::Lorem.paragraph})

organizations = Organization.all
users = User.all


# users.each do |u|
#   rand(1..2).times do
#     OrgMembership.create({user: u, organization: organizations.sample, aasm_state: ['pending','approved'].sample})
#   end
# end

organizations.each do |o|
  rand(1..2).times do
    OrgMembership.create({user: users.sample, organization: o, aasm_state: ['pending','approved'].sample})
  end
end

organizations.each do |o|
  Event.create({start_date: Time.now + rand(0..60).days, end_date: Time.now + rand(2..6).months, spots: rand(4..10), organization: o, details: Faker::Lorem.paragraph})
end

users.each do |u|
  rand(1..3).times do
    Review.create(body: Faker::Lorem.paragraph, star: rand(0..5), organization: organizations.sample, user: u)
  end
end

puts 'Done!'
