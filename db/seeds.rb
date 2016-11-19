User.create!(first_name: 'Roberto',
             last_name: 'Pando',
             email: 'rob@example.com',
             password: 'foobar',
             password_confirmation: 'foobar')

User.create!(first_name: 'Rick',
             last_name: 'Sanchez',
             email: 'rick@example.com',
             password: 'foobar',
             password_confirmation: 'foobar')

20.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example-#{n+1}@railstutorial.com"
  password = "password"
  User.create!(first_name: first_name,
               last_name: last_name,
               email: email,
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(content: content) }
end
