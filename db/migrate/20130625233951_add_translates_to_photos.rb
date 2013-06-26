class AddTranslatesToPhotos < ActiveRecord::Migration
  def change
    Photo.create_translation_table! title: :string
  end
end
