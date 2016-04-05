class AlterSectionsAddDescriptionColumn < ActiveRecord::Migration
  def change
    add_column :sections, :description, :string, null: false
  end
end
