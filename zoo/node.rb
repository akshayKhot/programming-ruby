class Node
  attr_accessor :task, :next

  def initialize(value)
    @task = value
    @next = nil
  end

  def append(node)
    @next = node
  end
end