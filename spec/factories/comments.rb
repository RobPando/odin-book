FactoryGirl.define do
  factory :comment do
    user 1
    post 1
    reply 'My comment'
  end
end
