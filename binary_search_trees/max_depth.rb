# Given a binary tree, find its maximum depth.
#
# The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

def max_depth(root)
    current_node = root

    if current_node.nil?
        return 0
    else
        [max_depth(current_node.left), max_depth(current_node.right)].max + 1
    end
end
