# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :flyer do
    happened_on 1.year.ago
    venue
    notes "A wonderful show."
    image { fixture_file_upload('spec/factories/test.jpg', 'image/jpg') }
  end
end
