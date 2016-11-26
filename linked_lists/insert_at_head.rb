# HR: Given the pointer to the head node of a linked list and an integer to add to the list, create a new node with the given integer, insert this node at the head of the linked list, and return the new head node. The head pointer given may be null meaning that the initial list is empty.

# Input: Node which is the head of a linked list, and node to insert
# Output: Return the head of the updated linked list

def insert_node_at_head(head, node)
  return node if head.nil?
  node.next = head
  node
end
