class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.string :author, null: false
      t.string :title
      t.text :message, null: false
      t.integer :section_id
      t.integer :parent_post_id
      t.timestamps null: false
    end
  end
end
