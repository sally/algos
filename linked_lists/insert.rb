require_relative 'linked_list_node'

# HR: Given the pointer to the head node of a linked list, an integer to add to the list, and the position at which the integer must be inserted. Create a new node with the given integer, insert this node at the desired position and return the head node.

# A position of 0 indicates head, a position of 1 indicates one node away from the head and so on. The head pointer given may be null meaning that the initial list is empty.

#########################################

## PSEUDOCODE:

def insert(head, position, value)
  node = LinkedListNode.new(value)
  counter = 0
  current_node = head
  until counter = position
    counter += 1
    if current_node.next.nil?
    current_node = current_node.next
  end
end
