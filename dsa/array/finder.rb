class Finder
  def self.max_prod(numbers)
    numbers.sort!
    a = numbers[-1] * numbers[-2]
    b = numbers[0] * numbers[1]
    [a, b].max
  end

  def self.max_prod_brute(numbers)
    m_prod = -Float::INFINITY
    limit = numbers.size - 1
    numbers.each_with_index do |num, i|
      (i+1..limit).each do |j|
        prod = num * numbers[j]
        m_prod = prod if prod > m_prod
      end
    end

    m_prod
  end

end