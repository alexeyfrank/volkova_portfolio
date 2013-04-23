class CreateMainPages < ActiveRecord::Migration
  def change
    create_table :main_pages do |t|
      t.text :content

      t.string :first_photo
      t.string :second_photo
      t.string :third_photo

      t.timestamps
    end
  end
end
