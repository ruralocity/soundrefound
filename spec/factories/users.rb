FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@email.com"}
    password "temp1234"
    password_confirmation "temp1234"
  end
end
