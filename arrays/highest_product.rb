# CTCI: Given a list_of_ints, find the highest_product you can get from three of the integers.
#
# The input list_of_ints will always have at least three integers.

#####################

# Note: The problem might be able to be boiled down to just finding the largest three integers, since this will return the highest product.

# Toy example:

# [2, 6, 5, 7, -1, 10]

# Then the highest product should be 10*7*6.

# Naive approach: Calculate all possible products that can be made by three integers from the array, and then return the maximum.
# This solution is O(N^3).

# Possible refinement:

# Keep track of a "maximum so far" element that allows us to iterate once,
  # also keep track of the different variables that allow us to create that maximum so far.

# Example:
# For our array [2,6,5,7,-1,10]

# Initialize the variables a,b,c as 2,6,5 respectively, with a being the smallest (can use a min heap)
# maximum so far is a*b*c
# While iterating:
  # @2: variables a,b,c and max stay the same
  # @6: variables a,b,c and max stay the same
  # @5: variables a,b,c and max stay the same
  # @7: change maximum so far to be the maximum between max so far divided by the minimum * 7, vs max so far
    # it changes to 7*5*6, compute new min to be 5
  # @-1: change maximum so far to be the maximum between max so far divided by the minimum * -1, vs max so far
    # max so far stays 7*5*6
  # @10: change maximum so far to be the maximum between max so far divided by the minimum * 10, vs max so far
    # max so far changes to 10*7*6, compute new min to be 6
# done iterating, return max so far

# Time complexity: One iteration, O(n) 
# Space complexity: Need to store three extra variables (possibly in a min heap of size 3),
