User.create!(name:  "管理者",
             email: "haterain0203@gmail.com",
             password:              "Haterain0203@",
             password_confirmation: "Haterain0203@",
             admin: true)

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password)