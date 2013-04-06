FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    fb_name      "username"
    email        { generate(:email) }
  end
end
