# Find the sum of all left leaves in a given binary tree.
#
# **Example Binary Tree**
#
# ```
#     3
#    / \
#   9  20
#     /  \
#    15   7
#
# There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.
# ```

class BinaryTreeNode
  attr_accessor :left, :right, :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value)
    return @left
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value)
    return @right
  end
end

# Pseudocode: do a depth-first traversal of the tree, collecting all left leaf values into a sum

def sum_of_left_leaves(root)
  sum = 0

  node_stack = []

  node_stack << root

  until node_stack.empty?
    current_node = node_stack.pop

    if current_node.left
      sum += current_node.left.value
      node_stack << current_node.left
    end

    if current_node.right
      node_stack << current_node.right
    end
  end

  sum
end

# Driver code

root0 = BinaryTreeNode.new(3)
root0.insert_left(9)
twenty = root0.insert_right(20)
twenty.insert_left(15)
twenty.insert_right(7)

p sum_of_left_leaves(root0)
#=> returns 24
