class Sorter
  def self.bin_sort_one(numbers)
    return [] if numbers.empty?

    zeros = numbers.count { |n| n == 0 }
    ones = numbers.size - zeros

    result = []
    zeros.times { result << 0 }
    ones.times { result << 1 }

    result
  end

  def self.bin_sort(numbers)
    result = []
    numbers.each { |num| result << 0 if num == 0 }

    remaining = numbers.size - result.size
    remaining.times { result << 1 }

    result
  end
end