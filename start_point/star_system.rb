class StarSystem
  attr_reader :name, :planets

  def initialize(name, planets)
    @name = name
    @planets = planets
  end

  def planet_names(planet_array = @planets)
    return planet_array.map{|planet|planet.name}
  end

  def get_planet_by_name(planet_name)
    return @planets.find{|planet| planet_name == planet.name}
  end

  def get_largest_planet
    return @planets.max{|planet_a, planet_b| planet_a.diameter <=> planet_b.diameter}
  end

  def get_smallest_planet
    return @planets.max{|planet_a, planet_b| planet_b.diameter <=> planet_a.diameter}
  end

  def get_planets_with_no_moons
    return @planets.find_all{|planet| planet.number_of_moons == 0}
  end

  def get_planets_with_more_moons(moon_number)
    number_of_moons = @planets.find_all{|planet| planet.number_of_moons > moon_number}
    return planet_names(number_of_moons)
  end

  def get_number_of_planets_closer_than(distance)
    return @planets.find_all{|planet| planet.distance_from_sun < distance}.count
  end

  def get_total_number_of_moons()
    return @planets.reduce(0){|total, planet| total += planet.number_of_moons}
  end

  def get_planet_names_sorted_by_increasing_distance_from_sun
    increasing_distance = @planets.sort{|planet_a, planet_b| planet_a.distance_from_sun <=> planet_b.distance_from_sun}
    return planet_names(increasing_distance)
  end

  def get_planet_names_sorted_by_size_decreasing
    decreasing_size = @planets.sort{|planet_a, planet_b| planet_b.diameter <=> planet_a.diameter}
    return planet_names(decreasing_size)
  end

end
