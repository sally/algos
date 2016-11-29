# WW: Check if a word is a palindrome or not.

# Pseudocode: We do this recursively.
  # Base case: The palindrome is one letter or empty - return true
  # Recursive case: Check if the first and last characters of the string are the same.
    # If yes, then return palindrome on the string with the first and last letters truncated
    # If no, then return false

def palindrome?(str)
  if str.empty? || str.length == 1
    return true
  else
    if str[0] == str[-1]
      palindrome?(str[1...-1])
    else
      return false
    end
  end
end

p palindrome?("racecar")
# Should return true

p palindrome?("a")
# Should return true

p palindrome?("")
# Should return true

p palindrome?("sierra")
# Should return false
