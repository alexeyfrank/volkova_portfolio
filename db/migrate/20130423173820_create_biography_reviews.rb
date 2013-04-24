class CreateBiographyReviews < ActiveRecord::Migration
  def change
    create_table :biography_reviews do |t|
      t.text :content
      t.string :author
      t.string :position
      t.integer :biography_id

      t.timestamps
    end

    Biography::Review.create_translation_table! content: :text, author: :string, position: :string
  end
end
