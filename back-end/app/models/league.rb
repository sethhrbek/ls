class League < ApplicationRecord

  def self.nearby_leagues_within_radius(lat, long, radius)
    point = [lat, long]
    leagues = League.near(point, radius)
    return leagues
  end

end
