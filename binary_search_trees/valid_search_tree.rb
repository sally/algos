require_relative 'binary_tree_node'

# A binary search tree is a binary tree in which, for each node:
  # 1. The node's value is greater than all values in the left subtree.
  # 2. The node's value is less than all values in the right subtree.

# IC: Write a function to check that a binary tree is a valid binary search tree.

# Idea: At each step, the node we check has a "minimum" and a "maximum" that it could possibly be. Do a depth first traversal of the nodes, passing the information of "minimum" and "maximum" along as we traverse

def valid_search_tree?(root)
  raise "Please enter a binary search tree with at least one node" if root.nil?

  stack = []

  stack << [root, -Float::INFINITY, Float::INFINITY]

  until stack.empty?
    current_node, lower_bound, upper_bound = stack.shift

    if lower_bound >= current_node.value || upper_bound <= current_node.value
      return false
    else
      if current_node.left
        stack << [current_node.left, lower_bound, current_node.value]
      end

      if current_node.right
        stack << [current_node.right, current_node.value, upper_bound]
      end
    end
  end

  true
end

# Tree 1
#               25
#        /              \
#       15              50
#    /      \        /      \
#   10      22      35      70
#  /  \    /  \    /  \    /  \
# 4   12  18  24  31  44  66  90

root1 = BinaryTreeNode.new(25)
fifteen1       = root1.insert_left(15)
fifty1         = root1.insert_right(50)
ten1           = fifteen1.insert_left(10)
twenty_two1    = fifteen1.insert_right(22)
thirty_five1   = fifty1.insert_left(35)
seventy1       = fifty1.insert_right(70)
four1          = ten1.insert_left(4)
twelve1        = ten1.insert_right(12)
eighteen1      = twenty_two1.insert_left(18)
twenty_four1   = twenty_two1.insert_right(24)
thirty_one1    = thirty_five1.insert_left(31)
fourty_four1   = thirty_five1.insert_right(44)
sixty_six1     = seventy1.insert_left(66)
ninety1        = seventy1.insert_right(90)

# Tree 2
#       100
#      /   \
#    20     500
#   /  \
# 10   30

root2         = BinaryTreeNode.new(100)
twenty2       = root2.insert_left(20)
five_hundred2 = root2.insert_right(500)
ten2          = twenty2.insert_left(10)
thirty2       = twenty2.insert_right(30)

# Tree 3
#        5
#     /    \
#    3      8
#   /      / \
#  12     7   6
#           /
#          10
#         /  \
#        9    11
root3     = BinaryTreeNode.new(5)
three3    = root3.insert_left(3)
eight3    = root3.insert_right(8)
twelve3   = three3.insert_left(12)
seven3    = eight3.insert_left(7)
six3      = eight3.insert_right(6)
ten3      = six3.insert_left(10)
nine3     = ten3.insert_left(9)
eleven3   = ten3.insert_right(11)

p valid_search_tree?(root1)
p valid_search_tree?(root2)
p valid_search_tree?(root3)
