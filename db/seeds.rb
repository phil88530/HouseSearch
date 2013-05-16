# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

flats = Property.create([{
  :name => "Sizeable house",
  :bedroom => 2, 
  :latitude => 51.501000,
  :longitude => -0.142000},

  {
  :name => "Trendy flat",
  :bedroom => 2,
  :latitude => 51.523778,
  :longitude => -0.205500},

  {
  :name => "Flat with stunning view",
  :bedroom => 2,
  :latitude => 51.504444,
  :longitude => -0.086667},

  {
  :name => "Unique flat",
  :bedroom => 1,
  :latitude => 51.538333,
  :longitude => -0.013333},

  {
  :name => "Isolated house",
  :bedroom => 1,
  :latitude => 50.066944,
  :longitude => -5.746944}
])
