require_relative 'binary_tree_node'

def pre_order(root)
  values = []

  traverse = lambda do |start_node|
    return unless start_node
    values << start_node.value
    traverse.call(start_node.left)
    traverse.call(start_node.right)
  end

  traverse.call(root)
  values
end

def in_order(root)
  values = []

  traverse = lambda do |start_node|
    return unless start_node
    traverse.call(start_node.left)
    values << start_node.value
    traverse.call(start_node.right)
  end

  traverse.call(root)
  values
end

def post_order(root)
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
# Postorder should return: ["A", "C", "B", "E", "D", "H", "I", "G", "K", "J", "F"]
p pre_order(root)
p in_order(root)
p post_order(root)
