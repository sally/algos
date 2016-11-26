require_relative 'linked_list_node'

# IC: Write a function for reversing a linked lis. Do it in-place.
#
# Your function will have one input: the head of the list.
#
# Your function should return the new head of the list.

# If we are on the first node, then make a reference to the second node.
# Then, set first node's next value equal to nil.
# Then, initialize previous node as the first node.

# In general, we must continue until the node we are examining is nil.
# We must hold reference to the previous node, and the node that follows after.
  # Call these prev_node and next_node.
# Change current node's next pointer to previous node.
# Reassign next node to current node.

def reverse(first_node)
  current_node = first_node.next
  first_node.next = nil
  prev_node = first_node

  until current_node = nil
    next_node = current_node.next
    current_node.next = prev_node

    prev_node = current_node
    current_node = next_node
  end

  prev_node
end
