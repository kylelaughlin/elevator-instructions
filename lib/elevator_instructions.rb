#Elevator Insturctions
#What floor should you be visiting? (you start on the ground floor, which is floor 0)
#Bonus Questions:
# => If you follow the instructions exactly, what is the highest floor you visit? The lowest floor?
# => Which floor do you visit most frequently?
# => How many times do you stop on the ground floor (not including the very first time)?

require 'pry'

def elevator_final_floor(instructions)
  floor = 0
  floors_visited = []
  instructions.split("").each do |signal|
    floor = move_elevator(signal,floor)
    populate_floors_visited(floors_visited, floor)
  end
  p floors_visited
  floor
end

def move_elevator(signal, floor)
  if signal == ")"
    floor += 1
  elsif signal == "("
    floor -= 1
  else
    floor
  end
  floor
end

def populate_floors_visited(floor_visited,floor)
  floor_visited << floor
end

elevator_final_floor("()())(((())))))")
