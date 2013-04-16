class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :full_name
      t.string :photo
      t.string :email
      t.string :state
      t.string :region
      t.string :phone

      t.timestamps
    end
  end
end
