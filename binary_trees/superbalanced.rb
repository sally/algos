require_relative 'binary_tree_node'

# IC: A tree is "superbalanced" if the difference between the depths of any two leaf nodes is no greater than one.

# Do a depth-first search, since this method makes it more likely that we find terminating nodes (short-circuit faster than breadth-first search)
# Keep track of the terminating levels in an array (the node and its level)
# If ever the terminating levels array gets to be bigger than cardinality 2, then we can short-circuit and return false

def superbalanced?(root)
  terminating_levels = []

  nodes_to_check = []

  nodes_to_check << [root, 0]

  until nodes_to_check.empty?
    current_node, current_level = nodes_to_check[0].first, nodes_to_check.shift.last

    if current_node.left || current_node.right
      nodes_to_check << [current_node.left, current_level + 1] if current_node.left
      nodes_to_check << [current_node.right, current_level + 1] if current_node.right
    else
      # if we have found a terminating node, then we must check certain things:
      # if the terminating levels already has 2 elements and
        # this terminating node's current level is distinct, then we short circuit and return false
        # else just continue
      # check whether the current level and the element inside has difference greater than 1
        # if yes, then short circuit and return false
        # else, shovel the current level in and continue

      if terminating_levels.length == 2
        return false if !terminating_levels.include?(current_level)
      else
        return false if terminating_levels.length == 1 && !(terminating_levels.first - current_level).between?(-1, 1)
        terminating_levels << current_level if terminating_levels.first != current_level
      end
    end
  end

  true
end

# Example 1:
#        F
#      /   \
#     D     J
#    / \   / \
#   B   E G   K
#  / \     \
# A   C     I
#          /
#         H

root1 = BinaryTreeNode.new('F')
d = root1.insert_left('D')
j = root1.insert_right('J')
b = d.insert_left('B')
e = d.insert_right('E')
a = b.insert_left('A')
c = b.insert_right('C')
g = j.insert_left('G')
k = j.insert_right('K')
i = g.insert_right('I')
h = i.insert_left('H')

p superbalanced?(root1)
# Should return false

# Example 2:
# A

root2 = BinaryTreeNode.new('A')

p superbalanced?(root2)
# Should return true

# Example 3:
#        F
#      /   \
#     D     J
#    / \   / \
#   B   E G   K
#  / \     \
# A   C     I

root3 = BinaryTreeNode.new('F')
d = root3.insert_left('D')
j = root3.insert_right('J')
b = d.insert_left('B')
e = d.insert_right('E')
a = b.insert_left('A')
c = b.insert_right('C')
g = j.insert_left('G')
k = j.insert_right('K')
i = g.insert_right('I')

p superbalanced?(root3)
# Should return true
