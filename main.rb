require_relative "lib/hashmap"

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

p test.keys
p test.values
p test.entries

puts test.capacity
puts test.length

puts test.get('kite')
p test.get('atul')

puts test.has?('kite')
puts test.has?('lion')
puts test.has?('atul')

# There is some fault in remove method
# remove method doesn't remove 'lion'.
# Instead it removed 'grape' & 'dog'
# Both have 1 similarity => i.e. they are present in a LinkedList
# Both are first members of their respected LinkedList
test.remove('lion')

p test.keys
p test.values
p test.entries
puts "X------------------------X---------------------------X-------------------------------X------------------------"

puts test.get('dog')
puts test.get('grape')
puts test.get('hat')
puts test.get('ice cream')
puts test.get('lion')

puts test.has?('lion')
puts test.has?('sikander')

puts test.remove('ice cream')

p test.keys
p test.values
p test.entries

test.clear
p test.values

test.set('moon', 'silver')
p test.capacity
p test.length
p test.keys
p test.values
p test.entries

test.set('guavava', 'red')
puts test.capacity
puts test.length
p test.keys
p test.values
p test.entries

test.set('moon', 'glorious')
test.set('guavava', 'green')

p test.entries
p test.keys
p test.values