# WW: Check if two strings are anagrams of each other.

# For the first string, call it string1 - iterate through and make a histogram of the occurencies of the character in string1
# For the second string, call it string2 - iterate through and subtract from the histogram of occurrencies for each character in string2
# Now iterate through the keys of the histogram hash - if any of these are nonzero, then return false
# Else, return true

def anagrams?(string1, string2)
  histogram_hash = Hash.new(0) # In Ruby, Hash.new(X) makes it such that X is the default value of any key inserted into the hash

  string1.each_char do |char|
    histogram_hash[char] += 1
  end

  string2.each_char do |char|
    histogram_hash[char] -= 1
  end

  histogram_hash.values.each do |occurrence|
    return false if !occurrence.zero?
  end

  true
end

p anagrams?("cat", "act")
# Should return true

p anagrams?("sierra", "kathy")
# Should return false

p anagrams?("", "pop")
# Should return false

p anagrams?("", "")
# Should return true

# Time and space complexity:
  # TIME: Linear. Iteration costs n time, and we do this three times, so we have 3n operations to do.
  # SPACE: Linear, since at worst the hash should be as long as the string lengths added together.
