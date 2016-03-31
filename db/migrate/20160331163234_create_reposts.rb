class CreateReposts < ActiveRecord::Migration
  def change
    create_table :reposts do |t|
      t.references :micropost, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
      
      t.index [:micropost_id, :created_at]
    end
  end
end
