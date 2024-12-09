require_relative 'node'
require_relative 'linkedlist'

# Implementation of hashes
class HashMap
  attr_accessor :buckets, :capacity, :factor

  def initialize
    @capacity = 16
    @buckets = Array.new(@capacity)
    @factor = 0.75
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = hash_code * prime_number + char.ord }

    hash_code
  end

  def set(key, value)
    load_factor = capacity * factor
    growth_functionality if length > load_factor

    node = Node.new(key, value)
    code = hash(key)
    size = buckets.length
    index = code % size

    if buckets[index].is_a?(Node)
      list = LinkedList.new
      list.add(buckets[index])
      list.add(node)

      buckets[index] = list
      return
    elsif buckets[index].is_a?(LinkedList)
      buckets[index].add(node)
    end

    buckets[index] = node
  end

  def get(key)
    code = hash(key)
    size = buckets.length
    index = code % size
    object = buckets[index]

    return nil if object.nil?

    return object.value if object.is_a?(Node) && object.key == key

    if object.is_a?(LinkedList)
      first = object.head
      second = first.next

      until second.nil?
        return second.value if second.key == key

        first = first.next
        second = first.next
      end

      return nil
    end
  end

  def has?(key)
    buckets.each do |element|
      node = element
      next if node.nil?

      return true if node.key == key
    end

    false
  end

  def remove(key)
    buckets.each_with_index do |object, index|
      next if object.nil?

      buckets[index] = nil if object.key == key
    end
  end

  def length
    count = 0
    buckets.each do |object|
      count += 1 if object.is_a?(Node)

      count += object.size if object.is_a?(LinkedList)
    end

    count
  end

  def clear
    buckets.each_index do |index|
      buckets[index] = nil
    end
  end

  def keys
    array = []
    buckets.each do |object|
      next if object.nil?

      array << object.key if object.is_a?(Node)

      if object.is_a?(LinkedList)
        first = object.head
        second = first.next

        until second.nil?
          array << second.key
          first = first.next
          second = first.next
        end
      end
    end

    array
  end

  def values
    array = []
    buckets.each do |object|
      next if object.nil?

      array << object.value if object.is_a?(Node)

      if object.is_a?(LinkedList)
        first = object.head
        second = first.next

        until second.nil?
          array << second.value
          first = first.next
          second = first.next
        end
      end
    end

    array
  end

  def entries
    array = []
    buckets.each do |object|
      pair = []
      next if object.nil?

      if object.is_a?(Node)
        pair << object.key
        pair << object.value
        array << pair
      elsif object.is_a?(LinkedList)
        first = object.head
        second = first.next

        until second.nil?
          arr = []
          arr << second.key
          arr << second.value
          array << arr

          first = first.next
          second = second.next
        end
      end
    end

    array
  end

  private

  def growth_functionality
    self.capacity = capacity * 2
    array = buckets
    self.buckets = Array.new(capacity)

    array.each do |object|
      # Call set method for each node
      if object.is_a?(Node)
        set(object.key, object.value)
      elsif object.is_a?(LinkedList)
        first = object.head
        second = first.next

        until second.nil?
          set(second.key, second.value)

          first = first.next
          second = first.next
        end
      end
    end
  end
end
