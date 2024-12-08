require_relative "lib/hashmap"

hash = HashMap.new
hash.set('atul', 'vishwakarma')
hash.set('aditya', 'shukla')
hash.set('anurag', 'verma')
hash.set('anuj', 'bamne')

p hash.buckets

puts hash.get('aditya')
puts hash.get('anurag')
puts hash.get('anuj')
puts hash.get('atul')
p hash.get('himanshu')