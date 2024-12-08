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
end
