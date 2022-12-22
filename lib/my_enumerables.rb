# frozen_string_literal: true

# A custom module that emulates ruby's build in enumerable functions
module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    for element in self
      yield element, index
      index += 1
    end
  end

  def my_select
    return self unless block_given?

    result = []
    my_each { |element| result.push(element) if yield element }
    result
  end

  def my_all?
    return self unless block_given?

    result = true
    my_each { |element| result = false unless yield element }
    result
  end

  def my_none?
    return self unless block_given?

    result = true
    my_each { |element| result = false if yield element }
    result
  end

  def my_count
    return length unless block_given?

    result = 0
    my_each { |element| result += 1 if yield element }
    result
  end

  def my_map
    return self unless block_given?

    result = []
    my_each_with_index { |element, index| result[index] = yield element }
    result
  end

  def my_inject(accumulator = nil, &block)
    arr = instance_of?(Range) ? to_a : self
    if block_given?
      accumulator = first if accumulator.nil?
        # first refers to first element of self i.e. the first element in the Array
        for i in 0..arr.size-2
          accumulator = block.call(accumulator, arr[i + 1])
        end
      if accumulator
        for i in 0..arr.size-1
          accumulator = block.call(accumulator, arr[i])
        end
      end
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self
      yield element
  end
  end
end
