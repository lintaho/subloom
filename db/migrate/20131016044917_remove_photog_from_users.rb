class RemovePhotogFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :photog, :boolean
  end
end
