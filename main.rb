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

puts test.capacity
puts test.length
puts test.get('dog')
puts test.get('grape')
puts test.get('hat')
puts test.get('ice cream')
puts test.get('lion')
puts test.has?('lion')
puts test.has?('sikander')
puts test.remove('lion')
p test.keys
p test.values
p test.entries
test.clear


test.set('moon', 'silver')
p test.capacity
p test.length
p test.keys.size

test.set('guavava', 'red')
puts test.capacity
puts test.length
p test.keys.size
