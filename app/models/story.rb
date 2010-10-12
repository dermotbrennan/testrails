class Story < ActiveRecord::Base
  belongs_to :user
  has_many :scenes

  validates_presence_of :name, :description
end
