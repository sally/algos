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
j = root.insert_right('J')
b = d.insert_left('B')
e = d.insert_right('E')
a = b.insert_left('A')
c = b.insert_right('C')
g = j.insert_left('G')
k = j.insert_right('K')
i = g.insert_right('I')
h = i.insert_left('H')

# Preorder should return ["F", "D", "B", "A", "C", "E", "J", "G", "I", "H", "K"]
# Inorder should return: ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"]

# Preorder traversal:
  # Keep track of values in array
  # Recursively:
    # Base case: Node has no children. Add node to values
    # Recursive case: Node has children. Add node to values and run method on left side, then run method on right side

def preorder_traversal(root, values = [])
  current_node = root

  if current_node.left || current_node.right
    values << current_node.value
    values = preorder_traversal(current_node.left, values) if current_node.left
    preorder_traversal(current_node.right, values) if current_node.right
  else
    values << current_node.value
  end

  values
end

p preorder_traversal(root)

# Inorder traversal:
  # Keep track of values in array
  # Recursively:
    # Base case: Node has no children. Add node to values, and return values array
    # Recursive case:
      # IF node has left child, then run function on child
      # Add value of node to array
      # IF node has right child, then run function on child

def inorder_traversal(root, values = [])
  if root.left || root.right
    inorder_traversal(root.left, values) if root.left
    values << root.value
    inorder_traversal(root.right, values) if root.right
  else
    values << root.value
  end

  values
end

p inorder_traversal(root)

def postorder_traversal(root, values=[])
  if root.left || root.right
    values = postorder_traversal(root.left, values) if root.left
    postorder_traversal(root.right, values) if root.right
    values << root.value
  else
    values << root.value
  end

  values
end

p postorder_traversal(root)

def postorder_lambda_traversal(root)
  values = []

  traverse = lambda do |start_node|
    return unless start_node
    traverse.call(start_node.left)
    traverse.call(start_node.right)
    values << start_node.value
  end

  traverse.call(root)
  values
end

p postorder_lambda_traversal(root)
