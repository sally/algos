# Source: [Leetcode](https://leetcode.com/problems/two-sum/)

# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
#
# You may assume that each input would have exactly one solution.
#
# Example:
#
# ```
# Given nums = [2, 7, 11, 15], target = 9,
#
# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].
# ```

# preliminary thoughts:
  # brute force solution is O(N^2) to calculate every possible combination of sum, look for target number

# O(N) way?
  # build hash of occurrences of numbers while iterating through array
  # for k in array:
    # look for target_num - k in hash map

def two_sum(array, target_num)
  histogram = {}

  for k in (0...array.length)
    if histogram[target_num - array[k]]
      return "Possible combination is #{array[k]} + #{target_num - array[k]} = #{target_num}"
    else
      histogram[array[k]] = true
    end
  end

  false
end

p two_sum([2,7,11,15], 9)

# complexity analysis
# time: O(N) for one iteration
# space: O(N) for histogram hash size
