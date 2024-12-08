require_relative 'node'
require_relative 'linkedlist'

class HashMap
  attr_accessor :capacity, :factor, :buckets

  def initialize
    @capacity = 16
    @factor = 0.75
    @buckets = Array.new(@capacity)
  end

  # key is of type "String"
  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  # This method fail because of collision
  def set(key, value)
    # Add the growing functionality for our Hashtable
    loading_factor = capacity * factor
    if length > loading_factor # Example length = 12 and we're adding the 13th element
      # Create an array of double the size of the capacity
      # Iterate over buckets array and for every node 
      #   Calculate hash_code for the key
      #   Using hash_code calculate index where this node will be inserted
      #   Copy current node from buckets to our new_array (at index calculated above)
      # END
      # Set our buckets array equal to this new array that we have populated
      
      new_capacity = capacity * 2
      array = Array.new(new_capacity)
      buckets.each do |element|
        if element.is_a?(Node)
          hash_code = hash(element.key)
          index = hash_code % new_capacity
          array[index] = element
        end

        if element.is_a?(LinkedList)
          first = element.head
          second = first.next

          until second.nil?
            hash_code = hash(second.key)
            index = hash_code % new_capacity
            if array[index].is_a?(Node)
              prev_node = array[index]
              list = LinkedList.new
              list.append(prev_node.key, prev_node.value)
              list.append(second.key, second.value)
        
              array[index] = list
            end
            
            array[index] = second
            
            first = first.next
            second = second.next
          end
        end

        self.capacity = new_capacity
        self.buckets = array
      end
      
    end

    node = Node.new(key, value)
    hash_code = hash(key)
    index = hash_code % buckets.length

    # If there's already a node at 'index' then we would like to replace it with a LL and add the current node to previous node
    if buckets[index].is_a?(Node)
      prev_node = buckets[index]
      list = LinkedList.new
      list.append(prev_node.key, prev_node.value)
      list.append(key, value)

      buckets[index] = list
      return
    end

    buckets[index] = node
  end

  def get(key)
    hash_code = hash(key)
    index = hash_code % buckets.length
    
    if buckets[index].is_a?(LinkedList)
      list = buckets[index]
      index = list.find(key)

      return list.at(index).value
    end
    node_at_index = buckets[index]

    return nil if node_at_index.key != key

    node_at_index.value
  end

  def has?(key)
    hash_code = hash(key)
    index = hash_code % buckets.length
    if buckets[index].is_a?(LinkedList)
      list = buckets[index]
      return list.contains?(key)
    end

    node_at_index = buckets[index]

    return true if node_at_index.key == key

    false
  end

  def remove(key)
    return nil unless has?(key)
    
    hash_code = hash(key)
    index = hash_code % buckets.length

    if buckets[index].is_a?(Node)
      node_at_index = buckets[index]

      buckets[index] = 0

      return node_at_index.value
    end

    if buckets[index].is_a?(LinkedList)
      # Iterate over the list until you find the key
      list = buckets[index]
      if list.contains?(key)
        index = list.find(key)
        list.remove_at(index)
      end
    end
  end

  def length
    count = 0
    index = 0
    while index < buckets.length
      count += 1 if buckets[index].is_a?(Node)

      if buckets[index].is_a?(LinkedList)
        count += buckets[index].size
      end

      index += 1
    end

    count
  end

  def clear
    index = 0
    while index < buckets.length
      buckets[index] = 0 if buckets[index].is_a?(Node) || buckets[index].is_a?(LinkedList)
      
      index += 1
    end
  end

  def keys
    keys = []
    index = 0
    while index < buckets.length
      keys << buckets[index].key if buckets[index].is_a?(Node)

      if buckets[index].is_a?(LinkedList)
        first = buckets[index].head
        second = first.next

        break if second.nil?

        until second.nil?
          keys << second.key
          first = first.next
          second = second.next
        end
      end
      index += 1
    end

    keys
  end
  
  def values
    values = []
    index = 0
    while index < buckets.length
      values << buckets[index].value if buckets[index].is_a?(Node)
      if buckets[index].is_a?(LinkedList)
        first = buckets[index].head
        second = first.next

        break if second.nil?

        until second.nil?
          values << second.value
          first = first.next
          second = second.next
        end
      end

      index += 1
    end

    values
  end

  def entries
    array = []
    
    index = 0
    while index < buckets.length
      pair = []
      if buckets[index].is_a?(Node)
        node_at_index = buckets[index]

        pair[0] = node_at_index.key
        pair[1] = node_at_index.value

        array << pair
      end

      if buckets[index].is_a?(LinkedList)
        first = buckets[index].head
        second = first.next

        break if second.nil?

        until second.nil?
          arr = []
          arr[0] = second.key
          arr[1] = second.value
        
          array << arr

          first = first.next
          second = second.next
        end
      end

      index += 1
    end

    array
  end
end