require_relative 'linked_list_node'

# A cycle occurs when a node's @next points back to a previous node in the list. The linked list is no longer linear with a beginning and an end - instead, it cycles through a loop of nodes.

# Write a function contains_cycle() that takes the first node in a singly-linked list and returns a boolean indicating whether the list contains a cycle.

def contains_cycle(first_node)
  turtle = first_node
  rabbit = first_node

  while turtle && rabbit
    turtle = turtle.next
    rabbit = rabbit.next.next

    if turtle == rabbit
      return true
    end
  end

  false
end

# Takes O(n) time and has O(1) space complexity

## Take aways:

## Variables thought of as pointers are infinitely valuable.
