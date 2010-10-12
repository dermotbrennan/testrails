class CreateScenes < ActiveRecord::Migration
  def self.up
    create_table :scenes do |t|
      t.integer :story_id
      t.string :scene_type
      t.string :name
      t.text :description
      t.string :location
      t.integer :previous_scene_id
      t.integer :next_scene_id
      t.integer :transport_mode_id
      t.decimal :longitude
      t.decimal :latitude
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :rating

      t.timestamps
    end

    [:story_id, :scene_type, :name, :started_at, :ended_at, :rating].each do |col|
      add_index :scenes, col
    end
  end

  def self.down
    drop_table :scenes
  end
end
