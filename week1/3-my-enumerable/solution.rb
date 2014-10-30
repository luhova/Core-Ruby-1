module MyEnumerable
  def map
    return to_enum(:map) unless block_given?
    result = []
    each { |element| result << yield(element) }
    result
  end

  def filter
    return to_enum(:filter) unless block_given?
    result = []
    each { |element| result << element if yield(element) }
    result
  end

  def reject
    result = []
    each { |element| result << element unless yield(element) }
    result
  end

  def reduce(initial = nil)
    return to_enum(:reduce) unless block_given?
    accumulator = initial
    each { |element| accumulator = yield accumulator, element }
    accumulator
  end

  def any?
    if block_given?
      each { |element| return true if yield(element) }
    else
      each { |element| return true if element }
    end
    false
  end

  def one?
    found_one = false

    if block_given?
      each do |element|
        if yield (element)
          return false if found_one
          found_one = true
        end
      end
    else
      each do |element|
        return false if found_one
        found_one = true
      end
    end
  end

  def all?
    if block_given?
      each { |element| return false unless yield(element) }
    else
      each { |element| return false unless element }
    end
    true
  end

  def each_cons(n)

  end

  def include?(element)
    each { |item| return true if item == element }
    false
  end

  def count(element = nil)
    if block_given?
      result = 0
      each { |item| result += 1 if item == element }
      result
    else
      size
    end
  end

  def size
    sum = 0
    each { |item| sum += 1}
    sum
  end

  def group_by
  end

  def min
  end

  def min_by
  end

  def max
  end

  def max_by
  end

  def minmax
  end

  def minmax_by
  end

  def take(n)
  end

  def take_while
  end

  def drop(n)
  end

  def drop_whie
  end
end