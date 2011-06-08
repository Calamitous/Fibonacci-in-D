#/usr/bin/env ruby

def fibonacci(elements, result = [])
  raise ArgumentError unless (0..47) === elements
  return result if elements == 0
  new_value = result.length < 2 ? result.length : sum_tail(result)
  fibonacci(elements - 1, result << new_value)
end

def sum_tail(from_array)
  from_array[-2..-1].inject(0) { |x, s| s += x }
end

number_of_elements = 10
number_of_elements = ARGV[0].to_i if ARGV[0]

puts fibonacci(number_of_elements).inspect
