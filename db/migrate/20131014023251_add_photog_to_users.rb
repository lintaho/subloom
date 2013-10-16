class AddPhotogToUsers < ActiveRecord::Migration
  def change
    add_column :users, :photog, :boolean, default: false
  end
end
