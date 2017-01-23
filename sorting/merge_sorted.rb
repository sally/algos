# IC: Suppose we have two arrays of the same size, containing integers. They are both sorted numerically, into arrays.
# Write a function to merge our arrays of orders into one sorted arrays.

#####################################

# Toy example: [1,3,6] and [2,4,5]
# Want to return [1,2,3,4,5,6]

# Idea: Have two pointers, one for each array
# The two points point to "next" in line from that array to be added to new sorted array

# Compare first two elements from the array, determine which one is smaller, say from array A.
# Push that element into the array to return
# Put pointer1 on the next element of array A, and pointer2 on the first element of array B
# Until one pointer is nil, compare the elements that are pointed to, add the smaller one to the array to return, then move the appropriate pointer accordingly
# If one pointer is nil, this means that we have exhausted that particular array. Continue adding from the remaining array until exhausted as well

# def merge_sorted(array1,array2)
#   merged_array = []
#   if array1.first < array2.first
#     merged_array << array1.first
#     pointer1 = 1
#     pointer2 = 0
#   else
#     merged_array << array2.first
#     pointer1 = 0
#     pointer2 = 1
#   end
#
#   until pointer1.nil? && pointer2.nil?
#     if pointer1 && pointer2
#
#     else
#
#     end
#   end
# end

# Problems encountered while trying to implement this algorithm:
  # Have to recurse based on pointers, causing us to do a lot of subchecks for pointers being nil and whatnot
  # Have no way to advance pointers, because they hold array data and not the index
# Slight tweaks:
  # Initialize merged array with appropriate length (sum of the two arrays lengths) [so that we can recurse based on the length]
  # Make pointers reference the indices instead of the actual array elements

def merge_sorted(array1, array2)
  merged_array_length = array1.length + array2.length
  merged_array = Array.new(merged_array_length, nil)

  array1_index = 0
  array2_index = 0
  merged_index = 0

  until merged_index == (merged_array.length)
    array1_exhausted = (array1_index >= array1.length)
    array2_exhausted = (array2_index >= array2.length)

    if !array1_exhausted && !array2_exhausted
      if array1[array1_index] > array2[array2_index]
        merged_array[merged_index] = array2[array2_index]
        array2_index += 1
        merged_index += 1
      else
        merged_array[merged_index] = array1[array1_index]
        array1_index += 1
        merged_index += 1
      end
    else
      if array1_exhausted
        merged_array[merged_index] = array2[array2_index]
        array2_index += 1
        merged_index += 1
      else
        merged_array[merged_index] = array1[array1_index]
        array1_index += 1
        merged_index += 1
      end
    end
  end

  merged_array
end

p merge_sorted([1,3,6],[2,4,5])
# Returns [1,2,3,4,5,6]

p merge_sorted([1,2,3],[4,5,6,7])
# Returns [1,2,3,4,5,6,7]

p merge_sorted([], [])
# Returns []
