module CarsHelper
	# Haversine formula: giving great-circle distances between two points on a sphere from their longitudes and latitudes
	def distance loc1, loc2
    	rad_per_deg = Math::PI/180
	    moon_radius_km = 1738 
	    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg
	    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg
	    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
	    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }
	    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
	    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
	    kilometres = moon_radius_km * c
	    return kilometres.to_i
	end
end
