class Array
  def to_hash
    Hash[*self.flatten]
  end

  def index_by
    map { |n| [yield(n), n] }.to_hash
  end

  def subarray_count(subarray)
  	each_cons(subarray.length).count(subarray)
  end
  
  def occurences_count
  	hash = map { |n| [n, self.count(n)] }.to_hash
  	hash.default = 0
  	hash
  end
end

[[[], []]].to_hash  #=> { [] => [] }