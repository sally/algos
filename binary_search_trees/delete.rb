## NOTE: Program is written s.t. lines on 24, 28, 31 are meant to be destructive but are currently not, due to Ruby scope. Can be rectified by wrapping all of these methods in a Solution class and adjusting accordingly.

require_relative 'binary_tree_node'
require_relative 'depth_first_traversal_ii'

# To delete a node from a binary search tree:

# Case 1.
  # The node has no children. In this case, we just set its parent's appropriate left or right value to nil
# Case 2.
  # The node has children. In this case, we try to swap it with its in-order successor. If it doesn't exist, then we try to swap it with its in-order predecessor, and delete the straggling node after the swap.

def delete(root, value)
  raise "Please enter a binary search tree with at least one node" if root.nil?

  current_node = search_for_node(root, value)

  raise "Value not found in given binary search tree" if !current_node

  if current_node.left || current_node.right
    if current_node.right
      node_to_swap_with = in_order_successor(current_node, value)
      current_node.value = node_to_swap_with.value
      node_to_swap_with = nil
    else
      node_to_swap_with = in_order_predecessor(current_node, value)
      current_node.value = node_to_swap_with.value
      node_to_swap_with = nil
    end
  else
    current_node = nil
  end
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

def in_order_successor(root, value)
  raise "Can't find in order successor of empty tree" if root.nil?

  raise "No in order successor found" if root.right.nil?

  find_minimal_element(root.right)
end

def find_minimal_element(root, value)
  raise "Can't find minimal element of empty tree" if root.nil?

  current_node = root

  until current_node.left.nil?
    current_node = current_node.left
  end

  current_node
end

def in_order_predecessor(root, value)
  raise "Can't find in order successor of empty tree" if root.nil?

  raise "No in order predecessor found" if root.right.nil?

  find_maximal_element(root.left)
end

def find_maximal_element(root, value)
  raise "Can't find minimal element of empty tree" if root.nil?

  current_node = root

  until current_node.right.nil?
    current_node = current_node.right
  end

  current_node
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

delete(root1, 4)
p in_order(root1)
