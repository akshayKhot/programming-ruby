

module Abbr

  def Abbr.abbr(words)
    table = {}
    seen = Hash.new(0)

    words.each do |word|
      next if word.empty?
      word.size.downto(1) do |len|
        abbrev = word[0...len]

        case seen[abbrev] += 1
        when 1
          table[abbrev] = word
        when 2  # found duplicate abbreviation
          table.delete(abbrev)
        else  # no need to go further
          break
        end
      end
    end

    words.each do |word|
      table[word] = word
    end

    table
  end
end