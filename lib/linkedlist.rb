require_relative "node"
# Linked List Implementation
class LinkedList
  attr_accessor :head

  def initialize
    @head = Node.new
  end

  def add(node)
    first = head
    second = head.next

    until second.nil?
      first = first.next
      second = second.next
    end

    first.next = node
  end

  def remove(key)
    first = head
    second = first.next

    until second.nil?
      if second.key == key
        first.next = second.next
        break
      end

      first = first.next
      second = first.next
    end
  end

  def size
    count = 0
    first = head
    second = head.next

    until second.nil?
      count += 1

      first = first.next
      second = second.next
    end

    count
  end

  def contains?(key)
    first = head
    second = first.next

    until second.nil?
      return true if second.key == key

      first = first.next
      second = first.next
    end

    false
  end
end
