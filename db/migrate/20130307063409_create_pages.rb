class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.string :state

      t.timestamps
    end
  end
end
