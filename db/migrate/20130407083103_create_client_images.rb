class CreateClientImages < ActiveRecord::Migration
  def change
    create_table :client_images do |t|
      t.string :image
      t.string :title
      t.integer :client_id

      t.timestamps
    end
  end
end
