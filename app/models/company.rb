class Company < ActiveRecord::Base
  attr_accessible :address, :name

=begin
  geocoded_by :address
  after_validation :geocode
=end

  #has_many :users
end
