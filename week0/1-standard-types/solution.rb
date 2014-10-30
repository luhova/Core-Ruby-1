def histogram(string)
   counts = Hash.new (0)
   string.each_char {|a| counts[a] += 1 }
   counts
end

def prime?(n)
  for number in 2..n-1
    if n % number == 0
      is_prime = false
      break
    else
      is_prime = true
    end
   end
   is_prime
end


def ordinal(n)
  if (11..13).include?(n % 100)
      "#{n}th"
    else
      case n % 10
      when 1 then "#{n}st"
      when 2 then "#{n}nd"
      when 3 then "#{n}rd"
      else        "#{n}th"
      end
  end
end

def palindrome?(object)
  object.to_s == object.to_s.reverse
end

def anagram?(word, other)
  histogram(word) == histogram(other)
end

def remove_prefix(string, prefix)
  string.sub(/\A#{pattern}/, '')
end

def remove_suffix(string, pattern)
  string.sub(/#{pattern}\z/, '')
end

def digits(n)
  arr = n.to_s.each_char.map { |element| element.to_i }
end

def fizzbuzz(range)
  range.map do |n|
    case
    when n % 3 == 0 && n % 5 == 0 then :fizzbuzz
    when n % 3 == 0               then :fizz
    when n % 5 == 0               then :buzz
    else                               n
    end
  end
end

def count(array)
  counts = Hash.new(0)
  array.each { |element| counts[element] += 1 }
  counts
end

def count_words(*sentences)
  count sentences.join.split.map {|element| element.downcase }
end