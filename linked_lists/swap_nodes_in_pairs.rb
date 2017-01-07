# Source: [Leetcode](https://leetcode.com/problems/swap-nodes-in-pairs/)

# Given a linked list, swap every two adjacent nodes and return its head.
#
# For example,
# Given `1->2->3->4`, you should return the list as `2->1->4->3`.
#
# Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.

class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

# Pseudocode:
  # start out by setting root to current node
  # if current node does not have a successor, then end program
  # if it does:
    # need variables to keep:
      # current node
      # successor
      # predecessor
      # super successor
    # we aim to switch current node and its successor
    # (there might not be a predecessor nor super successor, this means we are at the head or tail respectively)

# actual swapping process:
  # point predecessor.next to successor
  # point current_node.next to super_successor
  # point successor.next to current_node
# now set current_node to super_successor (if it's not nil)

# big O analysis
  # time: O(N)
  # space: constant - only keeping track of 4 variables at any given time
