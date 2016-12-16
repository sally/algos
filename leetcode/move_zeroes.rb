# Move Zeroes

# Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
#
# For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
#
# Note:
# You must do this in-place without making a copy of the array.
# Minimize the total number of operations.

####################################

# Iterate through the array. If we hit a 0, then pop the zero off and move it to the end. Instead of going on to the next element (since the index has changed) we tell our program to stay at the same index

# Initialize a counter that only goes up to the length of the array - once we have done this many operations of skipping or moving zeros, stop iterating

def move_zeroes(array)
  counter = 0
  length = array.length

  array.each_with_index do |num, index|
    break if counter == length
    if num.zero?
      array.push(array.delete_at(index))
      counter += 1
    else
      counter += 1
    end
  end
end

p move_zeroes([0,1,0,3,12])
