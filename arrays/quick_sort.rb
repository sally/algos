# Quick sort algorithm:

# Pick a random element in the array, call it the pivot
# Put every element less than the pivot to the left, and put every element more than the pivot on the right
# For the left-partition and the right-partition, run quick sort on that half.
# BASE CASE: The array is only one element.

# Example: [7,4,1,3,2,5]
# Suppose that the "pivot" is randomized to be 3. Note that the pivot ID is 3.
# We iterate through and place the elements where they beong, as stated above:
  # Since 7 > 3, we move 7 to the end:
    # [4,1,3,2,5,7]
    # Note that the pivot ID becomes 2
  # Since 4 > 3, we move 4 to the end
    # [1,3,2,5,7,4]
    # Note that the pivot ID becomes 1
  # Since 1 < 3 and its ID in the array is smaller than 1, we keep 1 where it is
  # Since 2 < 3, we move 2 to the front
    # [2,1,3,5,7,4]
    # Note that the pivot ID becomes 2
  # Since 5 > 3, and its ID in the array is bigger than 2, we keep 5 where it is

# We're done iterating, so we run the process again on the two partitions made: [2,1] and [5,7,4] ...

# Note: Logistics may make it not possible for us to iterate neatly through the array if we keep the pivot in, so we can iterate it without:
  # Suppose we had the same array, [7,4,1,3,2,5], with pivot randomized to be index 3
  # We iterate the length of [7,4,1,2,5], noting that the pivot index is 3
  # Since 7 > 3 and its index is >= pivot idx, we move it to the end and decrease pivot idx by 1
    # Get [4,1,2,5,7], with pivot idx 2
  # Since 4 > 3 and its index is >= pivot idx, we move it to the end and decrease pivot idx by 1
    # Get [1,2,5,7,4], with pivot idx 1
  # Since 1 < 3 and its index is < pivot idx, we keep it where it is
    # Get [1,2,5,7,4], with pivot idx 1
  # Since 2 < 3 and its index is >= pivot idx, we keep it where it is and increase pivot idx by 1
    # Get [1,2,5,7,4], with pivot idx 2

def quick_sort(array)
  if array.length == 1
    array
  else
    pivot =
  end
end
