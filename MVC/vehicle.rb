class Vehicle
  def initialize(color)
    @color = color
    @engine_started = false
  end

  def start_engine
    @engine_started = true
  end

  def engine_started?
    return @engine_started
  end
end

#.new is always calling the initialize constructor method
my_car = Vehicle.new('red')
p my_car

my_car.start_engine
p my_car
