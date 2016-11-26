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

# A binary tree is called 'perfect' if every level of the tree is completely full.
