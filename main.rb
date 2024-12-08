require_relative "lib/hashmap"

hash = HashMap.new
p hash.buckets
p hash.capacity
p hash.load_factor