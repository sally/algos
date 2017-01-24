# Source: Leetcode https://leetcode.com/problems/product-of-array-except-self/
#
# Given an array of n integers where n > 1, nums, return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
#
# Solve it without division and in O(n).
#
# For example, given [1,2,3,4], return [24,12,8,6].
#
# Follow up:
# Could you solve it with constant space complexity? (Note: The output array does not count as extra space for the purpose of space complexity analysis.)

# Idea: Do the multiplication in 2 passes.
    # First passes, go forward. Initialize a multiplier at 1.
        # 0: Set multiplier to index 0 element and pass.
        # 1: Multiply element by multiplier, set multiplier to index 1.
        # 2: Multiply element by multiplier, set multiplier to index 2.
        # ...

    # Second pass: Go backward. Initialize multiplier back to 1.
        # n-1: Set multiplier to index n-1 element and pass.
        # n-2: Multiply element by multiplier, set multiplier by index n-2.
        # ...
