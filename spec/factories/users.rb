FactoryGirl.define do
  factory :user do
    id 1
    first_name "Rick"
    last_name "Sanchez"
    email "rick@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
