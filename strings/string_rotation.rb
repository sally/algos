## CTCI: String Rotation
## Assume you have a method isSubstring which checks if one word is a substring of another. Given two strings s1 and s2, write code to check if s2 is a rotation of s1 using only one call to isSubstring.

## e.g. waterbottle is a rotation if erbottlewat.

####################

# Observations:
# If two strings are rotations of each other, say s1 and s2, then WLOG there exists a unique point in s1 where prior to that point, s1 is a substring of s2, and after that point, s1 is also a substring of s2.
# We can definitely do this with n calls to isSubstring.

# Another observation: We can also solve this by rotating s1 at worst n-1 times and checking for equality at each step. Costs O(n) time.

## KEY OBSERVATION: Note that if s1 and s2 are rotations of each other, then s1 is a substring of s2 + s2.
## e.g. "water" and "terwa" are rotations of each other, and "water" is a substring "terwaterwa"

# A function to check whether string2 is a substring of string1
# iterate through string1 and each step, check if we have a match for string2's first character
  # if we find a match, then continue to iterate through string1, but start iterating through string2
# this way, we can short circuit with a true
def is_substring?(string1, string2)
  return true if string2.empty?
  return false if string2.length > string1.length

  string2_matchings = 0

  string1.each_char do |string1_char|
    if string2_matchings.zero?
      if string1_char == string2[0]
        string2_matchings += 1
      end
    else
      if string1_char == string2[string2_matchings]
        string2_matchings += 1
      else
        string2_matchings = 0
      end

      if string2_matchings == string2.length
        return true
      end
    end
  end

  false
end

# Time complexity: O(mn), where m and n are the two different lengths of string1 and string2

def rotations?(string1, string2)
  is_substring?(string2+string2, string1)
end

# Time complexity: As long as is_substring? takes.
