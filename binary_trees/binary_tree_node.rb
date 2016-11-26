# A binary tree is a tree where every node has two or fewer children. The children are usually called @left and @right.

class BinaryTreeNode
  attr_accessor :left, :right, :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value)
    return @left
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value)
    return @right
  end
end

# 1. A binary tree is called 'perfect' if every level of the tree is completely full.

# 2. The smallest element in a binary search tree is 

# 3. Time and space costs for depth-first and breadth-first searches for binary trees are the same.

# DEPTH-FIRST
# TIME: At worst, we will have to visit every node, which will take O(n), linear in size of the graph.
# SPACE: O(n) in the worst case, to store the stack of vertices on the current search path + the set of already-visited vertices.
# Uses a stack.

# BREADTH-FIRST
# TIME: At worst, we will have to visit every node, which will take O(n), linear in size of the graph.
# SPACE: O(n) in the worst case, to store the queue of vertices on the current search level + the set of already-visited vertices.
# Uses a queue.

# Deciding which one to use, then, depends on the problem. You should use the one that could short-circuit and return the desired value as soon as possible.
# Example: Depth-first traversal will generally hit leaves before breadth-first.
