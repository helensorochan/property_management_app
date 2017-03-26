FactoryGirl.define do
  factory :user do
    name { Faker::Name.first_name }
    role { User.roles[:developer] }
    password { Faker::Internet.password }
    email { Faker::Internet.email }
  end
end
