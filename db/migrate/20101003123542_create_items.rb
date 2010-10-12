class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :scene_id
      t.string :type
      t.string :source_url
      t.string :author
      t.string :title
      t.text :content
      t.decimal :longitude
      t.decimal :latitude
      t.string :device
      t.datetime :source_created_at
      t.integer :rating
      t.string :asset_file_name
      t.string :asset_content_type
      t.integer :asset_file_size
      t.datetime :asset_updated_at

      t.timestamps
    end

    [:scene_id, :type, :source_created_at, :rating, :created_at].each do |col|
      add_index :items, col
    end
  end

  def self.down
    drop_table :items
  end
end
