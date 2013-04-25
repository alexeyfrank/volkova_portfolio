class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :preview

      t.timestamps
    end

    Project.create_translation_table! title: :string
  end
end
