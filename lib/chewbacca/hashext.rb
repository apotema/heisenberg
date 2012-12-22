class Hash
  def recursive_symbolize_keys
    new_hash = self.dup
    new_hash.symbolize_keys!
    new_hash.values.select{ |v| v.is_a?(Hash) }.each &:recursive_symbolize_keys!
    new_hash.values.select{ |v| v.is_a?(Array) }.each { |h| h.each &:recursive_symbolize_keys! }
    new_hash
  end

  def recursive_symbolize_keys!
    symbolize_keys!
    values.select{ |v| v.is_a?(Hash) }.each { |h| h.recursive_symbolize_keys! }
  end
end