class CreateProjectPhotos < ActiveRecord::Migration
  def change
    create_table :project_photos do |t|
      t.string :title
      t.string :image
      t.integer :project_id

      t.timestamps
    end

    Project::Photo.create_translation_table! title: :string
  end
end
