
task :fake => :environment do
  first_name  = "SuperBrit"
  last_name  = Faker::Name.last_name
  email = "super@email.com"
  password = "password"
  User.create!(first_name:  first_name,
              last_name:  last_name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              role: "super",
              activated_at: Time.zone.now)
end
