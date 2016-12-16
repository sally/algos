# Intersection of Two Arrays

# Given two arrays, write a function to compute their intersection.
#
# Example:
# Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2].
#
# Note:
# Each element in the result must be unique.
# The result can be in any order.

###############################

# Initialize an empty array to return
# Iterate through the first array, create a hash of 'present' or not
# Iterate through the second array, if the number is present in the hash, then delete it from the hash and add it to the array.

def intersection(nums1, nums2)
  present = Hash.new
  intersection_array = []

  nums1.each do |num|
    present[num] = 1
  end

  nums2.each do |num|
    if present[num]
      present.delete(num)
      intersection_array << num
    end
  end

  intersection_array
end

##################################

# Follow-Ups:
  # What if the given array is already sorted? How to optimize your algorithm?
  # What if num1's size is small compared to num2's size? Which algorithm is better?
  
