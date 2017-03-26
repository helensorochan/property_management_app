FactoryGirl.define do
  factory :property do
    name { Faker::Name.first_name }
    building_complex { create :building_complex }
  end
end
