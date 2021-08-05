
# A task can also be a dependency
class Task < Vertex
  include Comparable

  attr_accessor :name

  def initialize(name)
    super()
    @name = name
  end

  def to_s
    "#{@name}"
  end

  def eql?(other)
    @name.eql?(other.name)
  end

  def hash
    @name.hash
  end

  def <=>(other)
    other.name <=> @name
  end

end