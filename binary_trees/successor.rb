# CTCI: Successor

# Write an algorithm to find the "next" node (i.e. in-order successor of a given node in a binary search tree. You may assume that each node has a link to its parent)

##########################################

# Given a node, its successor will be found on the right, since all the elements on its left are less than the node.
# It will be the largest element found on the subtree formed from asking for that node's "right" element.
