require_relative 'linked_list_node'

# Write a function kth_to_last_node() that takes an integer kk and the head_node of a singly linked list, and returns the kth to last node in the list.

# Have a "walker" which is length k, with variables a and b to indicate the front and end of the walker respectively
# Start off by placing the end of the walker 'k' down the linked list
  # If k exceeds the length of the linked list, then raise an error
# Increment the walker's position by 1 until the end of the walker hits the end of the linked list
  # Return a, since a will be in the kth to last position in the linked list

def kth_to_last(head_node, k)
  a = b = head_node
  k.times do
    b = b.next
    raise "Input k exceeds the length of the list" if b.nil?
  end

  until b.nil?
    a = a.next
    b = b.next
  end

  a
end

# Time and space complexity:
  # Time would be O(n), because it takes k steps to move the pointer b down, and n-k steps to move the pointers down until they are done.
  # Space complexity: We only ever need 3 variables, so O(1).

# An alternative algorithm:
  # Retrieve the length of the list, call it n.
  # Traverse the list until you get to the n-kth item, and return it.

def kth_to_last_alt(head_node, k)
  counter = 0
  current_node = head_node

  while head_node
    current_node = current_node.next
    counter += 1
  end

  return_node = head_node

  counter.times do
    return_node = return_node.next
  end

  return_node
end

# Time and space complexity:
  # Time would be O(n), because it takes n steps to traverse the linked list. 
