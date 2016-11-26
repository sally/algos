require_relative 'binary_tree_node'

# IC: Write a function to find the 2nd largest element in a binary search tree.

# Since all of the greater numbers are on the right, we just need to find the node that has the last right child
# Base case is something of this form:
# X
#  \
#   Y

# Depth-first search of tree, continue searching to the right until we reach a node whose right child has no right child

# HOWEVER: Second largest isn't necessarily parent of the largest, since we could have something like
#       5
#     /   \
#    3     8
#         / \
#        7   12
#           /
#          10
#         /  \
#        9    11

# In which case 11 is the largest element, but it is not the parent of the right-most element.
# How do we find the second largest when the largest has a left subtree?
# It's the largest item in that left subtree.
# Hence, we write a function for finding the largest element in a tree. (It will be the right-most element.)

def find_largest(root)
  raise "Tree must have at least one node" if !root
  current_node = root
  if current_node.right
    find_largest(current_node.right)
  else
    current_node.value
  end
end

def second_largest(root)
  current_node = root

  if current_node.right.right
    second_largest(current_node.right)
  else
    if current_node.right.left
      find_largest(current_node.right.left)
    else
      current_node.value
    end
  end
end
