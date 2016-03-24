class UsersUpdate < ActiveRecord::Migration
  def change
    add_column :users, :tel, :string, :after => :email
    add_column :users, :location, :string, :after => :tel
    add_column :users, :contents, :text, :after => :location
  end
end
