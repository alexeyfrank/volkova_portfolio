class CreateBiographies < ActiveRecord::Migration
  def change
    create_table :biographies do |t|
      t.string :photo
      t.text :content

      t.timestamps
    end

    Biography.create_translation_table! content: :text
  end
end
