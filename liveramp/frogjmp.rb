# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

# compute the difference between y and x
# compute the difference divided by d
  # if there is a remainder, then return this quantity + 1
  # if there is not a remainder, then return this quantity

def solution(x, y, d)
  # write your code in Ruby 2.2

  remainder = (y-x) / d.to_f

  if remainder > 0
    return remainder.ceil.to_i
  else
    return remainder.to_i
  end
end
