require_relative 'binary_tree_node'

# Source: GeeksForGeeks http://www.geeksforgeeks.org/find-closest-element-binary-search-tree/

# Find the closest element in Binary Search Tree

# Given a binary search tree and a target node K, the task is to find the node with minimum absolute difference with given target value K.

# Idea: Use a greedy algorithm to keep track of the node that has the smallest absolute difference.

# If current node has value equal to key, then immediately return that key
# If the current node has a value less than the key, then run program on right subtree
# Else, run program on left subtree

def closest_element(root, key)
  raise "Please enter a tree with at least one node" if root.nil?

  closest_node, min_diff = root, (key - root.value).abs

  find_closest = lambda do |node|
    return unless node
    if (key - node.value).abs < min_diff
      closest_node, min_diff = node, (key - node.value).abs
    end

    if key == node.value
      closest_node, min_diff = node, (key - node.value).abs
      return
    end

    if node.value < key
      find_closest.call(node.right)
    else
      find_closest.call(node.left)
    end
  end

  find_closest.call(root)

  closest_node.value
end

# Tree 1. Binary Search Tree, Balanced
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

p closest_element(root1, 3)
# => 4

p closest_element(root1, 24)
# => 24

p closest_element(root1, 68)
# => 24
