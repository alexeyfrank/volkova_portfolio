class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :logo
      t.string :site
      t.string :state

      t.timestamps
    end
  end
end
