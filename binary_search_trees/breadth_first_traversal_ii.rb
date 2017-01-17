require_relative 'binary_tree_node'

def breadth_traversal(root)
  raise "Please enter a binary tree with at least one node" if root.nil?

  values = []
  queue = []

  queue << root

  until queue.empty?
    current_node = queue.shift
    values << current_node.value
    queue << current_node.left if current_node.left
    queue << current_node.right if current_node.right
  end

  values
end

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

# Breadth first traversal should print ["F", "D", "J", "B", "E", "G", "K", "A", "C", "I", "H"]

p breadth_traversal(root)
