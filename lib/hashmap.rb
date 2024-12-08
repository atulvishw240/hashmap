# Implementation of hashes
class HashMap
  attr_accessor :buckets, :capacity, :load_factor

  def initialize
    @capacity = 16
    @buckets = Array.new(@capacity)
    @load_factor = 0.75
  end
end
