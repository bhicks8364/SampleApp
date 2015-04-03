# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(first_name:  "Example",
             last_name: "Employee",
             email: "employee@example.com",
             password:              "Hannah08",
             password_confirmation: "Hannah08",
             role: "employee",
             admin:     false,
             activated: true,
             activated_at: Time.zone.now)
             
             
User.create!(first_name:  "Company",
             last_name: "Admin",
             email: "company@example.com",
             password:              "Hannah08",
             password_confirmation: "Hannah08",
             role: "company",
             admin:     false,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(first_name:  "Super",
             last_name: "User",
             email: "super@example.com",
             password:              "Hannah08",
             password_confirmation: "Hannah08",
             role: "super",
             admin:  true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(first_name:  "Agency",
             last_name: "Admin",
             email: "agency@example.com",
             password:              "Hannah08",
             password_confirmation: "Hannah08",
             role: "agency",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)
             
5.times do |n|
  first_name  = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email = "example-#{n+26}@sampleemployee.org"
  password = "password"
  box5 = n * 1
  User.create!(first_name:  first_name,
              last_name:  last_name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              role: "employee",
              activated_at: Time.zone.now)
end

5.times do |n|
  first_name  = Faker::Company.name
  last_name  = Faker::Company.suffix
  email = "example-#{n+1}@sampleemployee.org"
  password = "password"
  box5 = n * 1
  User.create!(first_name:  first_name,
              last_name:  last_name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              role: "company",
              activated_at: Time.zone.now)
end


# 5.times do |n|
#   first_name  = Faker::Name.first_name
#   last_name  = Faker::Name.last_name
#   email = "example-#{n+1}@samplecompany.org"
#   password = "password"
#   User.create!(first_name:  first_name,
#               last_name:  last_name,
#               email: email,
#               password:              password,
#               password_confirmation: password,
#               admin:     true,
#               activated: true,
#               activated_at: Time.zone.now,
#               profile_type: "CompanyProfile")
# end