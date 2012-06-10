class Company < ActiveRecord::Base
  attr_accessible :address, :name

  geocoded_by :address
  after_validation :geocode

  #has_many :users
end
