# CTCI: Delete Middle Node

# Implement an algorithm to delete a node in the middle (i.e. any node but the first and last node, not necessarily the exact middle) of a singly linked list, given only access to that node.

###########################################

# Iterate through the linked list until you find the appropriate node
# Keeping track of the previous node, set its pointer to the current node's next element.

# Time and space complexity:
  # Time: Linear time O(n), at worst we will have to go to the second-to-last-element, so it costs n-1 time.
  # Space: Constant, since we only have to keep track of previous and current nodes.
