require_relative "node"

# Implementation of hashes
class HashMap
  attr_accessor :buckets, :capacity, :load_factor

  def initialize
    @capacity = 16
    @buckets = Array.new(@capacity)
    @load_factor = 0.75
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = hash_code * prime_number + char.ord }

    hash_code
  end

  def set(key, value)
    node = Node.new(key, value)
    code = hash(key)
    size = buckets.length
    index = code % size

    buckets[index] = node
  end

  def get(key)
    code = hash(key)
    size = buckets.length
    index = code % size
    node = buckets[index]

    return nil if node.nil?

    return node.value if node.key == key
  end

  def has?(key)
    buckets.each do |element|
      node = element
      next if node.nil?
      
      return true if node.key == key
    end

    false
  end
end
