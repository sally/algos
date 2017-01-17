require_relative 'binary_tree_node'

# The minimal element of a binary search tree will be the left-most element in the tree.

def minimal_element(root)
  raise "Please enter a binary tree with at least one node" if root.nil?

  current_node = root

  until current_node.left.nil?
    current_node = current_node.left
  end

  current_node.value
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
fifteen       = root1.insert_left(15)
fifty         = root1.insert_right(50)
ten           = fifteen.insert_left(10)
twenty_two    = fifteen.insert_right(22)
thirty_five   = fifty.insert_left(35)
seventy       = fifty.insert_right(70)
four          = ten.insert_left(4)
twelve        = ten.insert_right(12)
thirty_one    = thirty_five.insert_left(31)
fourty_four   = thirty_five.insert_right(44)
sixty_six     = seventy.insert_left(66)
ninety        = seventy.insert_right(90)

p minimal_element(root1)
