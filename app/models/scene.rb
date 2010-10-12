class Scene < ActiveRecord::Base
  belongs_to :story
  has_many :items

  belongs_to :next_scene, :class_name => "Scene"
  belongs_to :transport_mode
  belongs_to :previous_scene, :class_name => "Scene"

  validates_associated :story
  validates_presence_of :name, :description
  
end
