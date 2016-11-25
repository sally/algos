require_relative 'binary_tree_node'

# A tree is "superbalanced" if the difference between the depths of any two leaf nodes is no greater than one.

## Must keep track of the "levels" on which the trees terminate, and check that the difference between these two levels aren't greater than 1.

def superbalanced?(root)

end

## Helper function to find all terminating levels of the tree.

# Initiate a counter which keeps track of what level you are on
# Initiate an empty array to keep track of all of the levels

## Recursively:
  # Base case: Node has no children - shovel the level into the array
  # Recursive case: Node has children - run the function on each of the children.

## Return the array

def find_terminating_levels(root)
  root = current_node
  level_tracker = 0
  terminating_levels = []

  if current_node.left || current_node.right

  else
    
  end
end
