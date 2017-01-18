require_relative 'binary_tree_node'

# To search if a given key is in a binary search tree, we first compare it with root. If the key is present at root, we return root. If key is greater than root's key, we recur for right subtree of root node. Otherwise, we recur of left subtree.

# This initial version works as well, but doesn't look as clean as the one below
# def search(root, value)
#   return false if root.nil?
#
#   current_node = root
#
#   if current_node.value == value
#     return true
#   elsif current_node.value < value
#     return search(current_node.right, value)
#   else
#     return search(current_node.left, value)
#   end
# end

def search(root, key)
  if root.nil?
    return false
  else
    if root.value == key
      return true
    else
      if root.value < key
        search(root.right, key)
      else
        search(root.left, key)
      end
    end
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
thirty_one    = thirty_five.insert_left(31)
fourty_four   = thirty_five.insert_right(44)
sixty_six     = seventy.insert_left(66)
ninety        = seventy.insert_right(90)

p search(root1,25)
# => true
p search(root1,15)
# => true
p search(root1,50)
# => true
p search(root1,10)
# => true
p search(root1,22)
# => true
p search(root1,35)
# => true
p search(root1,70)
# => true
p search(root1,4)
# => true
p search(root1,12)
# => true
p search(root1,31)
# => true
p search(root1,44)
# => true
p search(root1,66)
# => true
p search(root1,90)
# => true
p search(root1,1)
# => false
p search(root1,100)
# => false
