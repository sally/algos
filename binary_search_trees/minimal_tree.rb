require_relative 'binary_tree_node'
require_relative 'depth_first_traversal_ii'

# CTCI: Minimal tree

# Given a sorted (increasing order) array with unique integer elements, write an algorithm to create a binary search tree with minimal height.

####################################

# Toy example: [1,3,5,8,9]

# Need 1 and 3 to go next to each other, and 5 to be its parent -

# Want to start at midpoint, have that be the head
  # Look at the two remaining arrays, and find THEIR respective midpoints - insert them at left and right of head
  # continue in this way recursively until we have exhausted all of the elements of the array

# Toy example: [1,2,3,4,5,6,7,8,9]
  # current midpoint, 5 becomes head
  # two sub arrays are [1,2,3,4], and [6,7,8,9]
  # respective midpoints are 3 and 8, they become left and right children
  # two sub arrays are [1,2], [4] from 3 and [6,7], [9] from 8
  # ...etc.

def minimal_tree(array)
  raise "Please enter an array of at least one element" if array.empty?

  midpoint = array.length/2
  root = BinaryTreeNode.new(array[midpoint])

  add_node = lambda do |left, right|
    return if left > right

    mid = left + (right-left) / 2

    node = BinaryTreeNode.new(array[mid])

    node.left = add_node.call(left, mid - 1)
    node.right = add_node.call(mid + 1, right)

    node
  end

  root.left = add_node.call(0, midpoint - 1)
  root.right = add_node.call(midpoint + 1, array.length - 1)

  root
end

p tree = minimal_tree([1,2,3,4,5,6,7,8,9])
p in_order(tree)
