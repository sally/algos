require_relative 'binary_tree_node'

# 3 ways to do depth traversal:
  # Preorder: read data, then go left, then go right
  # Inorder: go left, then read data, then go right
  # Postorder: go left, then go right, then read data
# https://www.youtube.com/watch?v=9RHO6jU--GU

# Example:
#        F
#      /   \
#     D     J
#    / \   / \
#   B   E G   K
#  / \     \
# A   C     I
#          /
#         H

root = BinaryTreeNode.new('F')
d = root.insert_left('D')
j = root.insert_left('J')
b = d.insert_left('B')
e = d.insert_right('E')
a = b.insert_left('A')
c = b.insert_right('C')
g = j.insert_left('G')
k = j.insert_right('K')
i = g.insert_right('I')
h = i.insert_left('H')

# Preorder traversal:
  # Keep track of values in array
  # Recursively:
    # Base case: Node has no children. Add node to values
    # Recursive case: Node has children. Add node to values and run method on left side, then run method on right side

def preorder_traversal(root)
  current_node = root
  values = []

  if current_node.left || current_node.right
    values << current_node
    preorder_traversal(current_node.left) if current_node.left
    preorder_traversal(current_node.right) if current_node.right
  else
    values << current_node
  end

  values
end

preorder_traversal(root)
