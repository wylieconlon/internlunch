class Company < ActiveRecord::Base
  include Geokit::Geocoders
  attr_accessible :address, :name

  after_validation :geokitgeocode

  def geokitgeocode
    res   =   MultiGeocoder.geocode(self.address)
    self.latitude = res.lat
    self.longitude = res.lng
  end

=begin
  geocoded_by :address
  after_validation :geocode
=end

end
