class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.text :content

      t.timestamps
    end
  end
end
