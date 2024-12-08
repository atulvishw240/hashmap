class Node
  attr_accessor :key, :value, :address

  def initialize(key = nil, value = nil, address = nil)
    @key = key
    @value = value
    @address = address
  end
end
