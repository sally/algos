# HR: Given the pointer to head nodes of two sorted linked lists (data in both lists will be sorted in ascending order), change the next pointers to obtain a single, merged linked list which also has data in ascending order. Either head pointer given may be null, meaning that the corresponding list is empty.

# Input: Two heads of sorted linked lists
# Output: Head of merged list

##################################################

# Edge cases to consider:
  # One or more of the two heads are null => raise error
  # The two linked lists collectively have distinct values
# Pseudocode: Compare the two heads and decide which should be the new head
  # Have two pointers: One pointing at the next candidate to be pointed at in linked list 1, and the other pointing at the next candidate to be pointed at in linked list 2
  # At each step, connect the current node to whichever pointer is smaller in quantity

def merge_sorted_ll(head1, head2)
  # handle edge case for one or more or two heads being null here

  head1.value > head2.value ? current_node = head2 : current_node = head1

  if current_node == head1
    pointer1 = head1.next
    pointer2 = head2
  else
    pointer1 = head1
    pointer2 = head2.next
  end

  while pointer1 || pointer2
    if pointer1 && pointer2
      if pointer1.value > pointer2.value
        current_node.next = pointer2
        current_node = pointer2
        pointer2 = pointer2.next
      else
        current_node.next = pointer1
        current_node = pointer1
        pointer1 = pointer1.next
      end
    else
      if pointer1
        current_node.next = pointer1
        current_node = pointer1
        pointer1 = pointer1.next
      else
        current_node.next = pointer2
        current_node = pointer2
        pointer2 = pointer2.next
      end
    end
  end
end
