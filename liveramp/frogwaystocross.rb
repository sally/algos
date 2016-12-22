# https://codility.com/media/train/15-DynamicProgramming.pdf

# Problem: A small frog wants to get from position 0 to k. The frog can jump over any one of n fixed distances s_0,..,s_n-1 where each of these numbers are less than k. The goal is to count the number of different ways in which the frog can jump to position k. To avoid overflow, it is sufficient to rturn the result modulo q, where q is a given number.

# We assume that two patterns of jumps are different if, in one pattern, the frog visits a position which is not visited in the other pattern.

# Solution is done in O(n*k).

# Create an array ways_to_jump_to, which consists of k elements, so that ways_to_jump_to[j] will be the number of ways in which the frog can jump to position j.

# We update consecutive cells of array ways_to_jump_to. Since there is exactly one way for the frog to jump to position 0, ways_to_jump_to[0] = 1.

# Next, consider some position j > 0.
# The number of ways in which the frog can jump to position j with a final jump of s_i is ways_to_jump_to[j-s_i]. Thus, the number of ways in which the frog can get to position j is increased by the number of ways of getting to position j - s_i, for every jump s_i.

# More precisely, ways_to_jump_to[j] is increased by the value of ways_to_jump_to[j-s_i] for all (s_i < j) modulo q.

## Input: s, which is an array of the numbers s_0, .., s_n-1
      #   k, which is the position that the frog wants to get to (from 0)
      #   q, which is the number to mod by

def ways_to_jump(s,k,q)

end
