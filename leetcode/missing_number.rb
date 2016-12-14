# LeetCode: Missing Number

# Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.

# For example,
# Given nums = [0, 1, 3] return 2.
#
# Note:
# Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?

##############################################

# Iterate through the array
  # Keep track of the previous number iterated over
  # If the "next" iteratee exceeds the previous number + 1, then return false
  # Otherwise, return true

# def missing_number(nums)
#   previous = 0
#
#   nums.each do |num|
#     if num > previous + 1
#       return previous + 1
#     else
#       previous = num
#     end
#   end
# end

# nums = [0,1,3]
#=> returns 2
# nums = [0]
#=> returns [0]

# The expected result when given [0] is 1.
# Make sure to ask for edge case expectations when coding!

# def missing_number(nums)
#   expected = 1
#
#   nums.each_with_index do |num,index|
#     if nums[index+1] == expected
#       expected += 1
#     else
#       return expected
#     end
#   end
# end
#
# nums = [0,1,3]
#
# nums_edgecase = [0]
#
# p missing_number(nums)
# p missing_number(nums_edgecase)

# The expected result when given [1] is 0.
# Again, another edge case.

# def missing_number(nums)
#   current = 0
#   expected = 1
#
#   nums.each_with_index do |num, index|
#     if num != current
#       return current
#     elsif nums[index+1] == expected
#       current += 1
#       expected += 1
#     else
#       return expected
#     end
#   end
# end
#
# nums = [0,1,3]
#
# nums_edgecase_zero = [0]
# nums_edgecase_one = [1]
#
# p missing_number(nums)
# p missing_number(nums_edgecase_zero)
# p missing_number(nums_edgecase_one)

# The expected result when given [1,0] is 2.

# Turns out we misunderstood the question - the numbers from 0 to n can be in any order.

# Note: Had an idea about getting the length of the array and using it to calculate the sum :
# Formula for sum of numbers from 1 to n is n(n+1)/2
# Thought that this would be O(n^2)...
# Revising of thoughts reveals that, after asking Michael, length is a property that is stored upon modification of an array, so retrieving it is O(1).

def missing_number(nums)
  length = nums.length

  sum = (length * (length + 1)) / 2

  nums.each do |num|
    sum -= num
  end

  sum
end

nums = [0,1,3]
nums2 = [0]
nums3 = [1]
nums4 = [1,0]

p missing_number(nums)
p missing_number(nums2)
p missing_number(nums3)
p missing_number(nums4)
