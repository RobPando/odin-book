FactoryGirl.define do
  factory :user do
    first_name "Rick"
    last_name "Sanchez"
    email "rick@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
