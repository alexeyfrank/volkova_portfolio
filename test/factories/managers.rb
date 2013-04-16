# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :manager do
    full_name
    photo
    email
    region
    phone
  end
end
