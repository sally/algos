require_relative 'binary_tree_node'

# A binary search tree is a binary tree in which, for each node:
  # 1. The node's value is greater than all values in the left subtree.
  # 2. The node's value is less than all values in the right subtree.

# Write a function to check that a binary tree is a valid binary search tree.

## Initial thoughts: do recursion, base case would be that we have a leaf, in which case the binary tree is valid.
  # recursive case would be that we don't have a leaf, in which case we check whether the node we're on is greater than its left value, and less than its right value
  # however, this doesn't work because of this counter example:
#    5
#   /
#  3
# / \
#1   6

# Hence, we need to do a more thorough check - one that depends on more than just the direct parent of a node

# Obvious answer: Do a depth-first search and keep track of all of the ancestors for each node and whether the node should be greater than or less than each of them.

# Smarter?: Do a depth-first search, and keep track of the 'range' for which the children can stay in. If they exceed or fall short of that range, then return false

# Have a stack whose elements are [node, min_bound, max_bound]
# Start with [root, -\infty, +\infty]
# If the node is not a leaf, then call the method on left with max updated and on the right with min updated

def valid_search_tree(root)
  stack = []
  stack << [root, -Float::INFINITY, Float::INFINITY]

  until stack.empty?
    current_node,min_bound,max_bound = stack.pop

    if current_node.value <= min_bound || current_node.value >= max_bound
      return false
    end

    if current_node.left
      stack << [current_node.left, min_bound, current_node.value]
    end

    if current_node.right
      stack << [current_node.right, current_node.value, max_bound]
    end
  end

  true
end

# Example 1:
#  1
# / \
#3   2

root1 = BinaryTreeNode.new(1)
three = root1.insert_left(3)
two = root1.insert_right(2)

p valid_search_tree(root1)
# Should return false
