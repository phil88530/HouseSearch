class Property < ActiveRecord::Base
  attr_accessible :name, :bedroom, :latitude, :longtitude
  validates_presence_of :name, :bedroom, :latitude, :longtitude, :on => :create
  

  geocoded_by :name
end
