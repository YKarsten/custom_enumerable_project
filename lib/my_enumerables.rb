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
    my_each { |element| result.push(element) if yield element}
    result
  end

  def my_all?
    return self unless block_given?

    result = true
    my_each { |element| result = false unless yield element}
    result
  end

  def my_none?
    return self unless block_given?

    result = true
    my_each { |element| result = false if yield element}
    result
  end

  def my_count
    return length unless block_given?

    result = 0
    my_each { |element| result += 1 if yield element}
    result
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
