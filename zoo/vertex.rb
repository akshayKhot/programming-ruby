class Vertex
  attr_reader :color
  attr_accessor :start, :finish, :parent

  def initialize
    @color = :white
    @parent = nil
  end

  def is_new?
    @color == :white
  end

  def is_visited
    @color = :grey
  end

  def is_finished
    @color = :black
  end
end
