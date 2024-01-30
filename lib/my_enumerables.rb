module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    for i in 0...self.size
      block.call(self[i])
    end
    self
  end
  def my_select(&block)
    new_arr = []
    self.size.times do |i|
      new_arr << self[i] if block.call(self[i])
    end
    new_arr
  end
  def my_map(&block)
    new_arr = []
    self.size.times do |i|
      new_arr << block.call(self[i])
    end
    new_arr
  end
  def my_each_with_index(&block)
    for i in 0...self.size
      block.call(self[i],i)
    end
    self
  end
  def my_all?(&block)
    for i in 0...self.size
      return false unless block.call(self[i])
    end
    return true
  end
  def my_any?(&block)
    for i in 0...self.size
      return true if block.call(self[i])
    end
    return false
  end
  def my_none?(&block)
    for i in 0...self.size
      return false if block.call(self[i])
    end
    return true
  end
 def my_count
  if block_given?
    count = 0
    for i in 0...self.size
      count += 1 if yield(self[i])
    end
    return count
  else
    self.size
  end
 end
 def my_inject(initial_value, &block)
  accumulator = initial_value
  self.each do |element|
    accumulator = block.call(accumulator,element)
    accumulator
  end
  accumulator
 end
end
# class Hash
#   def my_select(&block)
#     new_hash = {}
#     hash_keys = self.keys
#     hash_keys.times do |i|
#       key = hash_keys[i]
#       value = self[hash_keys[i]]
#       new_hash[key] = value if block.call(key, value)
#     end
#     new_hash
#   end
# end