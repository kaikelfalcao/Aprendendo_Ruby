friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []

for friend in friends do
  if friend != 'Brian'
  invited_list.push(friend)
  end
end

puts invited_list
puts

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

puts friends.select { |friend| friend != 'Brian' }
puts 

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

puts friends.reject { |friend| friend == 'Brian' }
puts

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| puts "Hello, " + friend }
puts

my_array = [1, 2]

my_array.each do |num|
  num *= 2
  puts "The new number is #{num}."
end
puts 

my_hash = { "one" => 1, "two" => 2 }

my_hash.each { |key, value| puts "#{key} is #{value}" }

my_hash.each { |pair| puts "the pair is #{pair}" }
puts

fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.each_with_index { |fruit, index| puts fruit if index.even? }
puts 

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

puts friends.map { |friend| friend.upcase }
puts

my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']

puts my_order.map { |item| item.gsub('medium', 'extra large') }
puts

salaries = [1200, 1500, 1100, 1800]

puts salaries.map { |salary| salary - 700 }
puts 

responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
puts responses.select { |person, response| response == 'yes'}
puts 

my_numbers = [5, 6, 7, 8]
sum = 0

my_numbers.each { |number| sum += number }

puts sum
puts 

my_numbers = [5, 6, 7, 8]

puts my_numbers.reduce { |sum, number| sum + number }
puts

votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

new_votes = votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end

puts new_votes
puts

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

puts friends.map! { |friend| friend.upcase }
puts







