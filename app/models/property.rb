class Property < ActiveRecord::Base
  attr_accessible :name, :bedroom, :latitude, :longitude
  validates_presence_of :name, :bedroom, :latitude, :longitude, :on => :create

  scope :search_by_rooms, lambda  {|property| where("bedroom >= ?", property.bedroom).order("bedroom")}

  geocoded_by :name,
     :latitude => :latitude, 
     :longitude => :longitude,
      :units => :km
end
