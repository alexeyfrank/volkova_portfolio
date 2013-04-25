# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :biography_review, :class => 'Biography::Review' do
    content "MyText"
    author "MyString"
    position "MyString"
    biography_id 1
  end
end
