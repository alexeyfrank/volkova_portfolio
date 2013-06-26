class AddPositionToModels < ActiveRecord::Migration
  def change
    add_column :projects, :position, :integer, default: 0
    add_column :photos, :position, :integer, default: 0
    add_column :project_photos, :position, :integer, default: 0
  end
end
