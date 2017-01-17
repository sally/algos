require_relative 'binary_tree_node'
require_relative 'maximal_element'

# The in-order predecessor of a node, if it exists, will be the maximal element of the left subtree of that node.
# First, we search the tree of the node, tweaking the binary search tree algorithm to return the node instead of T/F
# Once we have the node, get minimal element of the right subtree (if it exists)

def in_order_predecessor(root, value)
  raise "Please enter a binary search tree with at least one node" if root.nil?

  current_node = search_for_node(root, value)

  raise "Could not find node with given value" if !current_node

  raise "No in-order predecessor found" if current_node.left.nil?

  maximal_element(current_node.left)
end

def search_for_node(root, value)
  return false if root.nil?

  current_node = root

  if current_node.value == value
    return current_node
  elsif current_node.value < value
    return search_for_node(current_node.right, value)
  else
    return search_for_node(current_node.left, value)
  end
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
eighteen      = twenty_two.insert_left(18)
twenty_four   = twenty_two.insert_right(24)
thirty_one    = thirty_five.insert_left(31)
fourty_four   = thirty_five.insert_right(44)
sixty_six     = seventy.insert_left(66)
ninety        = seventy.insert_right(90)

p in_order_predecessor(root1, 25)
# Returns 24

p in_order_predecessor(root1, 15)
# Returns 12

p in_order_predecessor(root1, 50)
# Returns 44

p in_order_predecessor(root1, 70)
# Returns 66

p in_order_predecessor(root1, 90)
# Raises error
