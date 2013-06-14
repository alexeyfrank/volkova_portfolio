# encoding: utf-8
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


def load_locales(locale, locales)
  puts "Load locales for: #{locale}"
  locales.each do |key, value|
    t = I18n::Backend::ActiveRecord::Translation.where(locale: locale).find_or_initialize_by_key key
    t.locale = locale
    t.value = value
    t.save!
  end
end


#ru locales

ru_locales = {
    'site_name' => 'Olga Tuponogova-Volkova',
    'site_sub_name' => 'Photo for your interior',
    'how_to_order' => 'Заказать',
    'menu.projects' => 'Проекты',
    'menu.photos_in_interier' => 'Фото в интерьере',
    'menu.bio' => 'Биография',
    'menu.contacts' => 'Контакты',

    'contacts.how_get_photos' => 'Как приобрести фотографии',
    'contacts.how_get_photos_text' => 'Если вас заинтересовали работы Ольги Тупоноговой-Волковой, пожалуйста, заполните форму ниже и мы свяжемся с вами в самое ближайшее время.',
    'contacts.participants' => 'Сотрудничество',
    'contacts.participants_text' => 'Если вы дизайнер и вам подумалось, что работы, увиденные на этом сайте, будут как нельзя лучше смотреться в ваших интерьерах - напишите нам на',
    'contacts.email' => 'coworking@photoroom.ru',
    'contacts.form.get_catalog' => 'Получить каталог с работами, описанием производства и подробными условиями покупки',
    'contacts.form.submit' => 'Отправить'
}

load_locales :ru, ru_locales

#en locales

en_locales = {
    'site_name' => 'Olga Tuponogova-Volkova',
    'site_sub_name' => 'Photo for your interior',
    'how_to_order' => 'How to Order',
    'menu.projects' => 'Projects',
    'menu.photos_in_interier' => 'As it looks',
    'menu.bio' => 'Biography',
    'menu.contacts' => 'Contacts',

    'contacts.how_get_photos' => 'How to buy',
    'contacts.how_get_photos_text' => 'Если вас заинтересовали работы Ольги Тупоноговой-Волковой, пожалуйста, заполните форму ниже и мы свяжемся с вами в самое ближайшее время.',
    'contacts.participants' => 'Сотрудничество',
    'contacts.participants_text' => 'Если вы дизайнер и вам подумалось, что работы, увиденные на этом сайте, будут как нельзя лучше смотреться в ваших интерьерах - напишите нам на',
    'contacts.email' => 'coworking@photoroom.ru',
    'contacts.form.get_catalog' => 'Получить каталог с работами, описанием производства и подробными условиями покупки',
    'contacts.form.submit' => 'Submit'
}

load_locales :en, en_locales