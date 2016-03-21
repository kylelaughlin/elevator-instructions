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
  elevator_ride_stats(floors_visited)
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

def populate_floors_visited(floors_visited,floor)
  floors_visited << floor
end

def lowest_floor_visited(floors_visited)
  floors_visited.min
end

def highest_floor_visited(floors_visited)
  floors_visited.max
end

def most_frequent_floor_visited(floors_visited)
  floor_visited_occurance = {}
  most_occurances = []
  floors_visited.each do |x|
    count = 0
    floors_visited.each do |y|
      if x == y
        count += 1
      end
    end
    floor_visited_occurance[x] = count
  end
  max_occurance = floor_visited_occurance.values.max
  floor_visited_occurance.each do |k, v|
    if v == max_occurance
      most_occurances << k
    end
  end
  most_occurances
end

def find_frequency_of_ground_floor(floors_visited)
  count = 0
  floors_visited.each do |e|
    count += 1 if e == 0
  end
  count
end

def elevator_ride_stats(floors_visited)
  puts "The lowest floor reached: #{lowest_floor_visited(floors_visited)}."
  puts "The highest floor reached: #{highest_floor_visited(floors_visited)}."
  puts "The most frequent floor(s) passed: #{most_frequent_floor_visited(floors_visited)}."
end

elevator_final_floor(")))))())(((()")
