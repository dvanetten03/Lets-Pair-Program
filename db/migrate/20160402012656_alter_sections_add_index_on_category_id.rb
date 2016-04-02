class AlterSectionsAddIndexOnCategoryId < ActiveRecord::Migration
  def change
    add_index :sections, :category_id
  end
end
