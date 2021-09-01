# Given an unsorted integer array (numbers),
# finds a pair with the given sum (target) in it.
class TwoSum
  def find_sum(numbers, target)
    h = Hash.new

    numbers.each_with_index do |num, i|
      diff = target - num

      if h.key?(num)
        return [h[num], num].sort
      else
        h[diff] = num
      end
    end

    return "not found"
  end

  def find_sum_binary(numbers, target)
    find(numbers.sort, 0, numbers.size - 1, target)
  end

  def find(numbers, low, high, target)
    return "not found" if (low == high)

    low_val = numbers[low]
    high_val = numbers[high]
    sum = low_val + high_val

    if sum == target
      [low_val, high_val]
    elsif (sum < target)
      find(numbers, low+1, high, target)
    else
      find(numbers, low, high-1, target)
    end
  end

  def find_sum_brute(numbers, target)
    limit = numbers.length - 1
    numbers.each_with_index do |num, i|
      (i+1..limit).each do |j|
        sum = num + numbers[j]
        return [numbers[i], numbers[j]] if sum == target
      end
    end

    return "not found"
  end
end