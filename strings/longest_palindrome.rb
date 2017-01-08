# Source: LC

# Given a string which consists of lowercase or uppercase letters, find the length of the longest palindromes that can be built with those letters.
# This is case sensitive for example "Aa" is not considered a palindrome here.

# Example:
# Input: "abccccdd"
# Output: 7

# Explanation:
# One longest palindrome that can be built is "dccaccd", whose length is 7.

# repeat question
# so given a string, i want to return the longest possible length of a palindrome i can make with the letters in the string - i'm not required to use all of the letters in the string to build this longest palindrome, right? like in the example, we don't have b

# clarification
# can assume that the empty string is supposed to return 0
# can i assume that the input will be a valid string of only letters?

# pseudocode
# iterate through the string and build a histogram hash of all chars in string
# iterate through the histogram hash's keys and values
# initialize longest palindrome length at 0
# initialize longest odd occurrence so far at 0
# for each value:
  # if it is even, then add its value to the longest palindrome length
  # if it is odd, then check its value against the longest odd occurrence so far - and update that variable accordingly
# when done iterating, 
