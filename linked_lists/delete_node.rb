require_relative 'linked_list_node'

# Delete a node from a singly-linked list, given only a variable pointing to that node.
# Example: Given 1 -> 2 -> 3 -> null, delete the node 2 given that target = node_with_2.

def delete_node(node_to_delete)
  next_node = node_to_delete.next

  if next_node
    raise "Can't delete the last node with this method!"
  else
    node_to_delete.value = next_node.value
    node_to_delete.next = next_node.next
  end
end

# Done in O(1) time and O(1) space.

# Takeaways:

## Edge cases for linked lists:
  # the last node
## It's hard to do pretty much anything with a linked_list unless you have variables to help you point to certain places in the linked_list.
## Changing pointers around is constant time, which is huge.
