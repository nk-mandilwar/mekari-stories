class AddColumnInPostAndComment < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :user_id, :integer, null: false, foreign_key: true
    add_column :comments, :parent_id, :integer

    add_index :posts, :user_id
    add_index :comments, :parent_id
  end
end
