# Source: [Leetcode](https://leetcode.com/problems/reverse-vowels-of-a-string/)

# Write a function that takes a string as input and reverse only the vowels of a string.
#
# Example 1:
# Given s = "hello", return "holle".
#
# Example 2:
# Given s = "leetcode", return "leotcede".
#
# Note:
# The vowels does not include the letter "y".

# pseudocode
# have two pointers, one starting at the beginning of the string, one at the end
# until the two pointers are pointing at the same index,
  # start iterating forwards through the string until hit a vowel
    # when hit vowel, start iterating backwards through the string until also hit a vowel

    # if this happens, then swap the two indices and continue advancing the first pointer

# big O analysis
  # time complexity O(n)
  # space complexity O(1)

def reverse_vowels(str)
  vowels = %w(a e i o u)
  forwards_pointer = 0
  backwards_pointer = str.length - 1

  while forwards_pointer < backwards_pointer
    if !vowels.include?(str[forwards_pointer])
      forwards_pointer += 1
      next
    end

    if !vowels.include?(str[backwards_pointer])
      backwards_pointer -= 1
      next
    end

    preceding_vowel = str[forwards_pointer]
    str[forwards_pointer] = str[backwards_pointer]
    str[backwards_pointer] = preceding_vowel

    forwards_pointer += 1
    backwards_pointer -= 1
  end

  str
end

p reverse_vowels("hello")
