# Source: [Leetcode](https://leetcode.com/problems/lexicographical-numbers/)

# Given an integer n, return 1 - n in lexicographical order.
#
# For example, given 13, return: [1,10,11,12,13,2,3,4,5,6,7,8,9].
#
# Please optimize your algorithm to use less time and space. The input size may be as large as 5,000,000.

# pseudocode

# notice that first number is always 1
# the next number is 10, 11, 12, ... 19
# the next number(s) would be 100, 101, ... 109, 110, 111, ...

# start with 1 in the first digit and then keep on adding digits to the right of 1 as long as it is strictly less than N, given number

# then start with 2 as first digit and repeat

# etc.
