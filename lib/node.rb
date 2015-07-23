class Node

  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end

  def tail?
    @next.nil?
  end

end
