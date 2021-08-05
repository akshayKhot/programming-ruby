class Vertex
  attr_accessor :tracked, :parent

  def initialize
    @tracked = false
    @parent = nil
  end
end
