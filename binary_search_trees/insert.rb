require_relative 'binary_tree_node'
require_relative 'depth_first_traversal_ii'

# Start at the root and recursively call insert on the left or ride node depending on the current node's value vs input value, until the value can be inserted at a free spot.
  # Make sure to return false if we run into the actual value, as binary trees by definition cannot have duplicate values

def insert(root, value)
  raise "Cannot insert into empty binary tree" if root.nil?

  if root.value == value
    return false
  elsif root.value < value
    if root.right
      insert(root.right, value)
    else
      root.insert_right(value)
    end
  elsif root.value > value
    if root.left
      insert(root.left, value)
    else
      root.insert_left(value)
    end
  end
end

# Tree 1
#       100                               100
#      /   \        Insert 40            /    \
#    20     500    --------->          20     500
#   /  \                              /  \
# 10   30                           10   30
#                                          \
#                                          40

root1 = BinaryTreeNode.new(100)
twenty = root1.insert_left(20)
five_hundred = root1.insert_right(500)
ten = twenty.insert_left(10)
thirty = twenty.insert_right(30)

p insert(root1, 40)
p thirty.right

# Let us create Tree2:
  #         50
  #      /     \
  #     30      70
  #    /  \    /  \
  #  20   40  60   80

root1 = BinaryTreeNode.new(50)
insert(root1, 30)
insert(root1, 70)
insert(root1, 20)
insert(root1, 40)
insert(root1, 60)
insert(root1, 80)

p in_order(root1)
