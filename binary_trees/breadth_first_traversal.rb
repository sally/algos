require_relative 'binary_tree_node'

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

# Want to return [F, D, J, B, E, G, K, A, C, I, H]

# Recursively:
  # Create an empty 'queue'
  # Create an empty 'values' array
  # Shovel the current root's value into the values array
  # Put the current root's left and right children into the queue
  # Run the function again on nodes starting from the queue

def breadth_first_traversal(root)
  values = []
  queue = []

  traverse = lambda do |current_node|
    return unless current_node
    values << current_node.value
    queue << 
  end
end

p breadth_first_traversal(root)
