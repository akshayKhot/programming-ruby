class Stack
  def initialize
    @values = []
  end

  def push(value)
    @values << value
  end

  def pop
    @values.pop
  end
end