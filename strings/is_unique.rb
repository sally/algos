# CTCI

# Implement an algorithm to determine if a string has all unique characters.

def is_unique?(string)
  histogram = Hash.new(0)
  string.each_char do |char|
    if histogram[char].zero?
      histogram[char] += 1
    else
     return false
    end
  end

  true
end

p is_unique?("string")

p is_unique?("")

p is_unique?("a")

p is_unique?("aa")

# What if you cannot use additional data structures?
