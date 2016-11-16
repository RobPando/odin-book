FactoryGirl.define do
  factory :comment do
    user nil
    post nil
    reply "MyText"
  end
end
