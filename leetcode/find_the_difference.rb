# Source: Leetcode https://leetcode.com/problems/first-unique-character-in-a-string/

# Given two strings s and t which consist of only lowercase letters.
#
# String t is generated by random shuffling string s and then add one more letter at a random position.
#
# Find the letter that was added in t.
#
# Example:
#
# Input:
# s = "abcd"
# t = "abcde"
#
# Output:
# e
#
# Explanation:
# 'e' is the letter that was added.

#######################################

# Iterate through "s" and obtain a histogram
# Iterate through "t" and subtract from the histogram, if ever we run into a character that is not in the histogram or goes below zero in the occurrences field, then we return it

def find_the_difference(s, t)
    histogram = {}
    s.each_char do |char|
      if histogram[char]
        histogram[char] += 1
      else
        histogram[char] = 1
      end
    end

    t.each_char do |char|
       if histogram[char]
         histogram[char] -= 1
         return char if histogram[char] == -1
      else
         return char
      end
    end
end
