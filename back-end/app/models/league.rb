class League < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude

  def self.nearby_leagues_within_radius(lat, long, radius)
    point = [lat, long]
    return League.near(point, radius)
  end

end
