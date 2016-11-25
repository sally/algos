# Write a function to reverse a string in-place.

# Recursively:
  # Initiate two pointers [keep track of index], one at the beginning and one at the end. Call them a and b respectively.
  # Base case: a is greater than or equal to b. Return the string
  # Recursive case: Swap the characters that are at index a and b.

def reverse(str)
  a = 0
  b = str.length - 1

  while a < b
    str[a],str[b] = str[b],str[a]

    a += 1
    b -= 1
  end

  str
end

# Time and space complexity:
  # Time is O(n). We "iterate" through the string once.
  # Space is O(1). We create two new variables.
