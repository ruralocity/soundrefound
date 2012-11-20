# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :flyer do
    happened_on "2012-11-19"
    venue nil
    notes "MyText"
  end
end
