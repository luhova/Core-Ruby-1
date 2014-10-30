require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Test
  class Collection
    include MyEnumerable

    def initialize(*data)
      @data = data
    end

    def each(&block)
      @data.each(&block)
    end
  end

  def test_map
    collection = Collection.new(*1..5)

    assert_equal [2, 3, 4, 5, 6], collection.map(&:succ)
    assert_equal true, collection.map.is_a?(Enumerator)
  end

  def test_filter
    collection = Collection.new(*1..10)

    assert_equal [1, 3, 5, 7, 9], collection.filter(&:odd?)
    assert_equal true, collection.filter.is_a?(Enumerator)
  end

  def test_reject
    collection = Collection.new(*1..10)

    assert_equal [1, 3, 5, 7, 9], collection.reject(&:even?)
    assert_equal true, collection.reject.is_a?(Enumerator)
  end

  def test_reduce
    collection = Collection.new(*1..10)

    assert_equal 55, collection.reduce(0) { |sum, n| sum + n }
    assert_equal true, collection.reduce.is_a?(Enumerator)
  end

  def test_include?
    collection = Collection.new(*1..10)

    assert_equal true, collection.include?(5)
  end

  def test_all?
    collection = Collection.new(2,4,6,8,10)

    assert_equal true, collection.all? { |item| item.even? }
  end

  def test_all?
    collection = Collection.new(nil, nil)

    assert_equal false, collection.all?
  end

  def test_any?
    collection = Collection.new(*1..10)

    assert_equal true, collection.any? { |item| item.even? }
  end

  def test_any?
    collection = Collection.new(nil, nil, 1)

    assert_equal true, collection.any?
  end

  def test_count
    collection = Collection.new(2,3,4,2,7,2)

    assert_equal 3, collection.count(2)
    assert_equal 6, collection.count
  end

  def test_size
    collection = Collection.new(*1..10)

    assert_equal 10, collection.size
  end

end
