# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client_image, :class => 'Client::Image' do
    image "MyString"
    title "MyString"
  end
end
