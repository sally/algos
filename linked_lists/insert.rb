require_relative 'linked_list_node'

# HR: Given the pointer to the head node of a linked list, an integer to add to the list, and the position at which the integer must be inserted. Create a new node with the given integer, insert this node at the desired position and return the head node.

# A position of 0 indicates head, a position of 1 indicates one node away from the head and so on. The head pointer given may be null meaning that the initial list is empty.

#########################################

## PSEUDOCODE:
  # Traverse linked list with couner until position input is reached, then
  # Change pointer of node to insert to reference the node at that position index
  # Change pointer of previous node to reference the node to insert
    # This means we must also store data of previous node to change its pointer

  # Edge cases to consider:
    # Suppose position exceeds the length of the linked list
      # Just put the node at the end
    # Suppose the linked list is empty
      # Raise an error in the case that the linked list is empty

def insert(head, position, value)
  raise "The linked list provided was empty" if head.nil?

  node = LinkedListNode.new(value)
  counter = 0
  prev_node = nil
  current_node = head

  until counter = position
    counter += 1
    if current_node.nil?
      prev_node.next = node
    else
      prev_node = current_node
      current_node = current_node.next
    end
  end
end

# Time complexity: O(n), where n is the length of the linked list.
# Space complexity: O(1), we have no structures that scale based on the size of the data structure.
