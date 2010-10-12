class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.integer :user_id
      t.string :name
      t.text :description

      t.timestamps
    end

    add_index :stories, :user_id
    add_index :stories, :name
    add_index :stories, :updated_at
    add_index :stories, :created_at
  end

  def self.down
    drop_table :stories
  end
end
