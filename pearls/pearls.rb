
def sort(numbers)
  bits = Array.new(numbers.max)
  numbers.each { |num| bits[num-1] = 1 }
  result = []
  bits.each_with_index { |bit, index| result << (index + 1) if bit }
  result
end

def count(numbers)
  counts = Array.new(10, 0)
  numbers.each { |n| counts[n-1] += 1 }
  counts
end

def erb(template, params)
  result = ""
  found = false
  template.each_char do |char|
    if found
      if char == "$"
        result << "$"
      else
        result << params[char.to_i]
      end
      found = false
    else
      found = (char == "$")
      next if found
      result << char
    end
  end

  result
end

def plain_binary_search(numbers, item)
  first = 0; last = (numbers.count - 1)
  while last >= first
    middle = (first + last) / 2
    value = numbers[middle]
    return middle if value == item

    item < value ?
      last = (middle - 1) :
      first = (middle + 1)
  end

  return -1
end

def recursive_binary_search(numbers, item)
  first = 0; last = (numbers.count - 1)
  search(numbers, item, first, last)
end

def search(numbers, item, first, last)
  return -1 if first > last

  middle = (first + last) / 2
  value = numbers[middle]

  return middle if value == item

  if item < value
    search(numbers, item, first, middle - 1)
  else
    search(numbers, item, middle + 1, last)
  end
end

require "set"

def word_finder(sentence)
  sentence.split(" ").to_set.to_a
end

def word_counter(sentence)
  word_count = Hash.new(0)
  sentence.split(" ").each do |word|
    word_count[word] += 1
  end
  word_count
end