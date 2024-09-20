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

  def my_select
    array_sel = []
    for item in self # rubocop:disable Style/For
      array_sel << item if yield(item)
    end
    array_sel
  end

  def my_all?
    for item in self # rubocop:disable Style/For
      return false unless yield(item)
    end
    true
  end

  def my_any?
    for item in self # rubocop:disable Style/For
      return true if yield(item)
    end
    false
  end

  def my_none?
    for item in self # rubocop:disable Style/For
      return false if yield(item)
    end
    true
  end

  def my_count
    return size unless block_given?

    count = 0
    for item in self # rubocop:disable Style/For
      count += 1 if yield(item)
    end
    count
  end

  def my_map
    result = []
    for item in self # rubocop:disable Style/For
      result << yield(item)
    end
    result
  end

  def my_inject(*args)
    if args.last.is_a?(Symbol)
      symbol = args.pop
      block = symbol.to_proc
    end

    initial = args.empty? ? first : args[0]

    start_index = args.empty? ? 1 : 0

    self[start_index..-1].each do |item|
      initial = block ? block.call(initial, item) : yield(initial, item)
    end

    initial
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
