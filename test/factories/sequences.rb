FactoryGirl.define do

  sequence :email do |n|
    "email_#{n}@mail.com"
  end

  [:slug, :title, :content, :full_name, :phone, :region].each do |trait|
    sequence trait do |n|
      "#{trait}_#{n}"
    end
  end

  [:image, :photo].each do |trait|
    sequence trait do |n|
      fixture_file_upload Rails.root.to_s + "/test/fixtures/photos/test.png", "image/png"
    end
  end
end
