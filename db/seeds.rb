# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(first_name:  "Example",
             last_name: "User",
             email: "user@example.com",
             password:              "Hannah08",
             password_confirmation: "Hannah08",
             admin:     false,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(first_name:  "Example",
             last_name: "Admin",
             email: "admin@example.com",
             password:              "Hannah08",
             password_confirmation: "Hannah08",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

25.times do |n|
  first_name  = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email = "example-#{n+1}@samplecompany.org"
  password = "password"
  User.create!(first_name:  first_name,
              last_name:  last_name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end