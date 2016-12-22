# https://codility.com/programmers/lessons/4-counting_elements/frog_river_one/

# Task description
# A small frog wants to get to the other side of a river. The frog is initially located on one bank of the river (position 0) and wants to get to the opposite bank (position X+1). Leaves fall from a tree onto the surface of the river.
#
# You are given a zero-indexed array A consisting of N integers representing the falling leaves. A[K] represents the position where one leaf falls at time K, measured in seconds.
#
# The goal is to find the earliest time when the frog can jump to the other side of the river. The frog can cross only when leaves appear at every position across the river from 1 to X (that is, we want to find the earliest moment when all the positions from 1 to X are covered by leaves). You may assume that the speed of the current in the river is negligibly small, i.e. the leaves do not change their positions once they fall in the river.
#
# For example, you are given integer X = 5 and array A such that:
#
#   A[0] = 1
#   A[1] = 3
#   A[2] = 1
#   A[3] = 4
#   A[4] = 2
#   A[5] = 3
#   A[6] = 5
#   A[7] = 4
# In second 6, a leaf falls into position 5. This is the earliest time when leaves appear in every position across the river.
#
# Write a function:
#
# def solution(x, a)
# that, given a non-empty zero-indexed array A consisting of N integers and integer X, returns the earliest time when the frog can jump to the other side of the river.
#
# If the frog is never able to jump to the other side of the river, the function should return −1.
#
# For example, given X = 5 and array A such that:
#
#   A[0] = 1
#   A[1] = 3
#   A[2] = 1
#   A[3] = 4
#   A[4] = 2
#   A[5] = 3
#   A[6] = 5
#   A[7] = 4
# the function should return 6, as explained above.
#
# Assume that:
#
# N and X are integers within the range [1..100,000];
# each element of array A is an integer within the range [1..X].
# Complexity:
#
# expected worst-case time complexity is O(N);
# expected worst-case space complexity is O(X), beyond input storage (not counting the storage required for input arguments).
# Elements of input arrays can be modified.

##################################

# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

# Pseudocode:
# Idea: Create an array that keeps track of the second at which a leaf covers the relevant position (length X). Initialize with values -1
# (Not a hash, because this actually may take more space? The array doesn't need keys, and the keys of the hash would just be the indices anyway. Lookup for array is O(1) if you do it by index.)
# We can use X to keep track of how many positions we have remaining to fill

# Iterate through array
  # At each step, check if the corresponding entry in the array is -1.
    # If it is, then replace it the entry in the array with the current index and subtract one from X
      # If X is 0, then return the current index
    # If it's not, then this means that the entry has already been visited - continue on
# If we finish this iteration, then return -1

def solution(x, a)
  time_covered = [-1] * x

  a.each_with_index do |num, index|
    if time_covered[num - 1] == -1
      time_covered[num - 1] = index
      x -= 1

      if x == 0
        return index
      end
    end
  end

  return -1
end
