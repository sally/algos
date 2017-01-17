require_relative 'binary_tree_node'
require_relative 'minimal_element'

# The in-order successor of a node, if it exists, will be the minimal element of the right subtree of that node.
# First we search for the node, tweaking the binary search tree algorithm to return the node instead of T/F
# Once we have node, get minimal element of right subtree (if it exists)

def in_order_successor(root, value)
  raise "Please enter a binary search tree with at least one node" if root.nil?

  current_node = search_for_node(root, value)

  raise "Could not find node with the given value" if !current_node

  raise "No in-order successor found" if current_node.right.nil?

  minimal_element(current_node.right)
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

p in_order_successor(root1, 25)
# Returns 31

p in_order_successor(root1, 15)
# Returns 18

p in_order_successor(root1, 50)
# Returns 66

p in_order_successor(root1, 70)
# Returns 90

p in_order_successor(root1, 90)
# Raises error
