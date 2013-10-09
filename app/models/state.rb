class State < ActiveRecord::Base
  attr_accessible :name, :abbreviation

  has_many :cities

  belongs_to :capital, :class_name => 'City'
end
