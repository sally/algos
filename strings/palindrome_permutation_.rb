# CTCI

# Given a string, write a function to check if it is a permutation of a palindrome. A palindrome is a word or phrase that is the same forwards as it is backwards. A permutation is a rearrangement of letters.
# the palindrome does not need to be limited to just dictionary words.

# HINT: Think of characteristics of palindromes to solve this problem.

#############################################

# A word is a palindrome if and only if there is an even number of characters for each character, and at most one character that has an odd number.
# In fact, we don't even need to keep track of the number. We just need to check whether or not these 
