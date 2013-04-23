# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_photo, :class => 'Project::Photo' do
    title "MyString"
    image "MyString"
    project_id 1
  end
end
