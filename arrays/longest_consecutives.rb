# SP: Find the length of the longest subarray within an array which has consecutive, increasing numbers.

# Example input: [1,2,3,5]
# Example output: 3

# Example input: [44, 11, 12, 9]
# Example output: 2

###################################

# initialize counter at 0 to keep track of length of subarray (c = 1)
# initialize variable at 1 to keep track of maximum of lengths of subarrays (max_consec = 1)
# going through example [44,11,12,9]        ### [43,44,11,12,9] @ this pt, c = 2, but
  # @44: 44+1 , check next: if it's not nil, check is it 45?
    # if it is, then add one to c
    # else: reset counter to 1
    # take max of max_consec and c, and set max_consec equal to it
 # @11: 11+1, check next: if it's not nil, is it 12?
    # c += 1, so c = 2
    # take max of max_consec and c, and set max_consec equal to it
# @12: 12+1, check next: if it's not nil, is it 13?
  # reset counter to 1
  # take max of max_consec and c, and set max_consec equal to it
# @9: check next: it's nil, so don't do any further checks
  # take max of max_consec and c, and set max_consec equal to it

#=> return max_consec, which is 2

# EDGE CASES:
  # two subarrays with same length and both max length
  # empty array

def get_max_subarray(array)
  return 0 if array.empty?

  counter = 1
  max_consec = 1

  array.each_with_index do |num, index|
    if num + 1 == array[index + 1]
      counter += 1
      max_consec = [max_consec, counter].max
    else
      counter = 1
    end
  end

  max_consec
end

p get_max_subarray([1,2,4])
p get_max_subarray([44, 11, 12, 9])
p get_max_subarray([])

# counter = 1, max_consec = 1
# @1: counter = 2, max_consec = 2
# @2: counter = 1
# @4: counter = 1
# return max_consec, which is 2

# Time complexity: O(n) because just one iteration
# Space complexity: O(1), just two variables that keep singular data and don't increase in size (NOT value) based on array
