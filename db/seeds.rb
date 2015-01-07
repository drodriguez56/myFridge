require 'faker'

10.times do
  User.create(username:Faker::Internet.user_name, email:Faker::Internet.email,password:Faker::Internet.password)
end
10.times do
 Food.create(name:Faker::Lorem.word, expiration_date: Time.now)
 end
