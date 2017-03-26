FactoryGirl.define do
  factory :floor do
    description { Faker::Name.first_name }
    property { create :property }
  end
end
