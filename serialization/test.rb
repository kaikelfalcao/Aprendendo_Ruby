require 'json'

class Car 
    def initialize(make, year)
        @make = make
        @year = year
    end
    attr_reader :make, :year

    def to_json(options = {})
        { make: @make, year: @year }.to_json(options)
    end
end

car_data = { :make => "bmw", :year => "2003" }

puts new_car = Car.new(car_data[:make], car_data[:year])

puts json = new_car.to_json

