FactoryGirl.define do
  factory :building_complex do
    name { Faker::Name.first_name }
    user { create :user }
  end
end
