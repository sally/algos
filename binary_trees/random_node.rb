# Source: CTCI (6th edition, 4.11)

# Random Node: You are implementing a binary tree class from scratch which, in addition to insert, find, and delete, has a method getRandomNode() which returns a random node from te tree. All nodes should be equally likely to be chosen. Design and implement an algorithm for getRandomNode, and explain how you would implement the rest of the method.

# Idea:
  # When initializing a new tree, modify the "insert node" function to add one to a "left count" or a "right count" for each node, depending on whether you insert to the left or to the right for each node.
  # Then for each node (starting at the head), we have:
    # 1/n chance of choosing current node
    # k/n chance of going left and calling getRandomNode on the left child
    # j/n chance of going right and calling getRandomNode on the right child
    # where n is the size of the current tree (or subtree) we are on.
