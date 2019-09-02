class Automobile
    attr :model, :make, :color
end

car = Automobile.new
car.model = "Tacoma"
car.make = "Toyota"
car.color = "grey"

print "My car is a #{car.make} #{car.model} and is the color #{car.color}\n\n"