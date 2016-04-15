class AddUserIdAndIndexesToPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :author
    add_column :posts, :user_id, :integer

    add_index :posts, :user_id
    add_index :posts, :parent_post_id
    add_index :posts, :section_id
  end
end
