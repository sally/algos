require_relative 'binary_tree_node'

# IC: Write a function to find the 2nd largest element in a binary search tree.

#### Idea:

# Second largest element in BST is either

# *
#  \
#   .

# OR

#  .
#   \
#    .
#   /
#  .
# / \
#.   *

# We should go as right as possible until we hit a node that has no right child
# If this node has no left children, then it is the right childless predecessor
# If it does, then return the largest element of the left subtree of the right childless predecessor

def second_largest(root)
  if root.right.nil?
    if root.left.nil?
      return "There is no second largest element in this tree."
    else
      return largest(root.left)
    end
  end

  current_node = root

  until current_node.right.right.nil?
    current_node = current_node.right
  end

  if current_node.right.left.nil?
    return current_node.value
  else
    return largest(current_node.right.left)
  end
end

def largest(root)
  current_node = root

  until current_node.right.nil?
    current_node = current_node.right
  end

  current_node.value
end
