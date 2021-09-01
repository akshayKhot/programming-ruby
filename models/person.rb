

class Person
  def initialize(name)
    @name = name
  end

  def self.speak
    puts "I am speaking"
  end

  def greet
    puts "Hello, my name is #{@name} and I am a #{self.class}"
  end

  def say
    puts "#{@name} saying something"
  end

  def method_missing(name, *args)
    puts "Person: No method named #{name} found"
  end
end

class Employee < Person

  def initialize(name)
    super
  end

  def method_missing(name, *args)
    puts "Employee: No method found"
  end
end