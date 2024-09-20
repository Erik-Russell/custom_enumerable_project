# frozen_string_literal: true

# Enumberable - a test of creating custom enumerables
module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    for item in self # rubocop:disable Style/For
      yield(item, index)
      index += 1
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self # rubocop:disable Style/For
      yield(item)
    end
  end
end
