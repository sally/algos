# CTCI: Remove dups

# Write code to remove duplicates from an unsorted linked list.

# Follow ups:
# How would you solve this problem if a temporary buffer is not allowed?

############################################

# Iterate through the linked list
# Have a histogram hash that keeps tracks of occurrencies of values in the list
# If ever reach a value that already has an occurrence in the hash, don't increment the occurrence
# Have a variable that keeps track of the previous node and point it to the current node's next node if we find a duplicate

# Edge cases:
# Empty linked list

def remove_dups(head)
  current_node = head
  previous_node = nil
  histogram = Hash.new(0)

  until current_node.nil?
    if histogram[current_node].zero?
      histogram[current_node.value] += 1
      previous_node = current_node
      current_node = current_node.next
    else
      previous_node.next = current_node.next
      current_node = previous_node.next
    end
  end
end

# Interesting problem ran into while solving: What is the process of switching around the pointers, and the variables representing previous_node and current_node without losing data?
# Case: we have 1 -> 2 -> 1 -> 1 -> ...
                  # PREV #CUR
# We must delete two 1's, meaning that previous_node should stay where it is
# Previous's next should now point to current's .next
# Reassign current_node to previous_node's .next

# Note: If we want to return the head, then we do so by storing head in another variable and returning it at the very end.

# Time complexity: O(n), we must traverse the entire linked list to scour for duplicates.
# Space complexity: Also O(n), we have to (at worst) store as many key/value pairs as there are linked list nodes.
