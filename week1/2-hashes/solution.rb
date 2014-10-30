class Hash
  def pick(*keys)
    new_hash = self.dup
  	new_hash = select { |key, value| keys.include?(key) }
    new_hash
  end

  def except(*keys)
    new_hash = self.dup
  	new_hash = reject { |key, value| keys.include?(key)}
    new_hash
  end

  def compact_values
    new_hash = self.dup
  	new_hash = reject { |key, value| value == false || value.nil? }
    new_hash
  end

  def defaults(hash)
    new_hash = self.dup
    hash.each { |key, value| new_hash[key] = value unless self.include?(key) }
    new_hash
  end

  def pick!(*keys)
  	select! { |key, value| keys.include?(key) }
  end

  def except!(*keys)
   reject! { |key, value| keys.include?(key) }
  end

  def compact_values!
   reject! { |key, value| value == false || value.nil? }
  end

  def defaults!(hash)
    hash.each { |key, value| self[key] = value unless self.include?(key) }
    self
  end
end