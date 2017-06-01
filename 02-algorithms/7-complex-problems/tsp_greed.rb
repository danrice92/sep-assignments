class City
  attr_accessor :name
  attr_accessor :visited

  def initialize(name)
    @name = name
    @visited = false
  end
end

city1 = City.new("Chicago")
city2 = City.new("Denver")
city3 = City.new("Seattle")
city4 = City.new("San Francisco")
city5 = City.new("New York City")
cities = [city1, city2, city3, city4, city5]

class Trip
  attr_accessor :first_city
  attr_accessor :second_city
  attr_accessor :distance

  def initialize(first_city, second_city, distance)
    @first_city = first_city
    @second_city = second_city
    @distance = distance
  end
end

trip1 = Trip.new(city1, city2, 1018)
trip2 = Trip.new(city1, city3, 2078)
trip3 = Trip.new(city1, city4, 2202)
trip4 = Trip.new(city1, city5, 837)
trip5 = Trip.new(city2, city3, 1315)
trip6 = Trip.new(city2, city4, 1320)
trip7 = Trip.new(city2, city5, 2005)
trip8 = Trip.new(city3, city4, 821)
trip9 = Trip.new(city3, city5, 2914)
trip10 = Trip.new(city4, city5, 2951)
trip11 = Trip.new(city2, city1, 1018)
trip12 = Trip.new(city3, city1, 2078)
trip13 = Trip.new(city4, city1, 2202)
trip14 = Trip.new(city5, city1, 837)
trip15 = Trip.new(city3, city2, 1315)
trip16 = Trip.new(city4, city2, 1320)
trip17 = Trip.new(city5, city2, 2005)
trip18 = Trip.new(city4, city3, 821)
trip19 = Trip.new(city5, city3, 2914)
trip20 = Trip.new(city5, city4, 2951)
trips = [trip1, trip2, trip3, trip4, trip5, trip6, trip7, trip8, trip9, trip10, trip11, trip12, trip13, trip14, trip15, trip16, trip17, trip18, trip19, trip20]

def traveling_salesman(all_cities, current_city, all_trips, best_path=[])
  best_next_trip = nil
  all_trips.each do |trip|
    if trip.first_city.name == current_city.name
      if best_next_trip == nil && trip.second_city.visited == false
        best_next_trip = trip
      elsif trip.second_city.visited == false && trip.distance < best_next_trip.distance
        best_next_trip = trip
      end
    end
  end
  best_path << best_next_trip
  puts "The trip from #{best_next_trip.first_city.name} to #{best_next_trip.second_city.name} is #{best_next_trip.distance} miles."
  current_city.visited = true
  if best_next_trip.first_city.name == current_city.name
    next_city = best_next_trip.second_city
  else
    next_city = best_next_trip.first_city
  end
  until best_path.length == all_cities.length - 1
    traveling_salesman(all_cities, next_city, all_trips, best_path)
  end
end

traveling_salesman(cities, city1, trips)
