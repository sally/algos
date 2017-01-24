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
    # Initialize an array to return.
    # First passes, go forward through input array. Initialize a multiplier at 1.
        # 0: Push 1 to return array. Set multiplier to index 0 of return array.
        # 1: Push multiplier * array[1] to return array. Set multiplier to index 1 of return array.
        # ...

    # Second pass: Go backward through input array.
        # n-1: Set multiplier to n-1 element of array and pass.
        # n-2: Set n-2 element of return array as multiplier * n-2 element of return array. Set multiplier to multiplier*n-2 element of input array and pass.
        # ...

    # Return created array
