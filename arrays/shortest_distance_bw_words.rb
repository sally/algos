require_relative 'minimal_differences_bw_sorted'

# Source: [Leetcode](https://tonycao.gitbooks.io/leetcode-locked/content/LeetCode%20Locked/c1.4.html)
#
# Given a list of words and two words word1 and word2, return the shortest distance between these two words in the list.
#
# For example, Assume that words = ["practice", "makes", "perfect", "coding", "makes"].
#
# Given word1 = "coding", word2 = "practice", return 3. Given word1 = "makes", word2 = "coding", return 1.

# idea: create indices hash, keys are words and values are arrays of indices
# find shorest distance between 2 numbers in 2 sorted arrays
# if two words are equal, then problem becomes finding the shortest distance between two distinct numbers in array

def make_indices_hash(words)
  indices_hash = Hash.new {|hash, key| hash[key] = []}

  for k in 0...words.length do
    indices_hash[words[k]] << k
  end

  indices_hash
end
