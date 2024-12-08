# Node Abstract Data Type
class Node
  attr_accessor :key, :value, :next

  def initialize(key = nil, value = nil, address = nil)
    @key = key
    @value = value
    @next = address
  end
end
