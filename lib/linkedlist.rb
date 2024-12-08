require_relative "node"

# Implementation of LinkedList
class LinkedList
  attr_accessor :head

  def initialize
    @head = Node.new
  end

  def append(key, value)
    # Create a new node with value "value"
    node = Node.new(key, value)

    # Go to the end of the list
    current = head

    current = current.next until current.next.nil?

    # Update the next field in end node
    current.next = node
  end

  def prepend(key, value)
    node = Node.new(key, value)

    temp = head.next
    head.next = node
    node.next = temp
  end

  def size
    count = 1
    return 0 if head.next.nil?

    current = head.next
    until current.next.nil?
      count += 1
      current = current.next
    end

    count
  end

  def first
    head.next
  end

  def tail
    current = head
    current = current.next until current.next.nil?

    return current
  end

  def at(index)
    count = 0
    current = head.next

    until count == index
      count += 1
      current = current.next
    end

    current
  end

  def pop
    current = head.next
    after_current = current.next
    until after_current.next.nil?
      current = current.next
      after_current = after_current.next
    end

    current.next = nil
  end

  def contains?(key)
    current = head.next
    loop do
      return true if current.key == key

      break if current.next.nil?

      current = current.next
    end

    false
  end

  def find(key)
    index = 0
    current = head.next
    loop do
      return index if current.key == key

      return nil if current.next.nil?

      index += 1
      current = current.next
    end
  end

  def insert_at(key, value, index)
    node = Node.new(key, value)
    start = 0
    current = head
    after_current = current.next

    until start == index
      start += 1
      current = current.next
      after_current = after_current.next
    end

    current.next = node
    node.next = after_current
  end

  def remove_at(index)
    start = 0
    current = head
    after_current = current.next

    until start == index
      start += 1
      current = current.next
      after_current = after_current.next
    end

    current.next = after_current.next
  end

  def to_s
    current = head.next
    string = ""
    loop do
      break if current.next.nil?

      string << "( #{current.value} ) -> "
      current = current.next
    end

    string << "nil"
  end
end
