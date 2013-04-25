user = User.find_or_initialize_by_email 'admin@admin.com'
user.password = '12345'
user.save
user.activate

configus.pages.each do |value|
  page = Page.find_or_initialize_by_slug value[0]
  page.title = value[1]
  page.save
  page.activate
end


if MainPage.count.zero?
  MainPage.create
end

if Biography.count.zero?
  Biography.create
end