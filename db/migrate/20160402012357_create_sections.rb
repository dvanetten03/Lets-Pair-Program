class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :category_id
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
