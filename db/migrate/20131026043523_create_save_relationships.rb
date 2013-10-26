class CreateSaveRelationships < ActiveRecord::Migration
  def change
    create_table :save_relationships do |t|
      t.integer :user_id
      t.integer :link_id

      t.timestamps
    end
    add_index :save_relationships, :user_id
    add_index :save_relationships, :link_id
    add_index :save_relationships, [:user_id, :link_id], unique: true
  end
end
