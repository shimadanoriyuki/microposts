class AddColumnUsers < ActiveRecord::Migration
  def change
    add_column :users, :remove_avatar, :boolean
    add_column :users, :avatar_cache, :string
  end
end
