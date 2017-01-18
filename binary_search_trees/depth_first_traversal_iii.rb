require_relative 'binary_tree_node'

def pre_order(root)
  raise "Cannot traverse an empty tree" if root.nil?

  values = []

  values.push(root.value)

  pre_order_subtree(root.left, values) if root.left
  pre_order_subtree(root.right, values) if root.right

  values
end

def pre_order_subtree(node, values = [])
  values.push(node.value)
  pre_order_subtree(node.left, values) if node.left
  pre_order_subtree(node.right, values) if node.right
end

def in_order(root)
  raise "Cannot traverse an empty tree" if root.nil?

  values = []

  in_order_subtree(root.left, values) if root.left
  values << root.value
  in_order_subtree(root.right, values) if root.right

  values
end

def in_order_subtree(node, values = [])
  in_order_subtree(node.left, values) if node.left
  values << node.value
  in_order_subtree(node.right, values) if node.right
end

def in_order_lambda(root)
  raise "Cannot traverse an empty tree" if root.nil?

  values = []

  traverse = lambda do |node|
    return unless node
    traverse.call(node.left)
    values << node.value
    traverse.call(node.right)
  end

  traverse.call(root)

  values
end

def post_order(root)
  raise "Cannot traverse an empty tree" if root.nil?

  values = []

  post_order_subtree(root.left, values) if root.left
  post_order_subtree(root.right, values) if root.right
  values << root.value
end

def post_order_subtree(node, values = [])
  post_order_subtree(node.left, values) if node.left
  post_order_subtree(node.right, values) if node.right
  values << node.value
end

def post_order_lambda(root)
  raise "Cannot traverse an empty tree" if root.nil?

  values = []

  traverse = lambda do |node|
    return unless node
    traverse.call(node.left)
    traverse.call(node.right)
    values << node.value
  end

  traverse.call(root)

  values
end

# Tree 5. Non-numeric binary search tree, not balanced
#        F
#      /   \
#     D     J
#    / \   / \
#   B   E G   K
#  / \     \
# A   C     I
#          /
#         H

root5 = BinaryTreeNode.new('F')
d = root5.insert_left('D')
j = root5.insert_right('J')
b = d.insert_left('B')
e = d.insert_right('E')
a = b.insert_left('A')
c = b.insert_right('C')
g = j.insert_left('G')
k = j.insert_right('K')
i = g.insert_right('I')
h = i.insert_left('H')

p pre_order(root5)
p in_order(root5)
p in_order_lambda(root5)
p post_order(root5)
p post_order_lambda(root5)
