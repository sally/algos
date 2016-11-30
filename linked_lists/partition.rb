# CTCI: Partition

# Write code to partition a linked list around a value x, such that all nodes less than x come before all nodes greater than or equal to x. If x is contained within the list, the values of x only need to be after the elements less than x (see below). The partition element x can appear anywhere in the "right" partition, it doesn't need to appear between the left and right partitions.

# Example: 3 -> 5 -> 8 -> 5 -> 10 -> 2 -> 1 [partition = 5]
# Output: 3 -> 1 -> 2 -> 10 -> 5 -> 5 -> 8

#########################

# In the above example, the partition that was gotten was 3 -> 1 -> 2 and 10 -> 5 -> 5 -> 8.
# Observations:
  # KJR is to iterate through the linked list and collect all of the elements that are smaller than the given element into a new linked list,
  # and collect the rest of the elements into another linked list
  # (Kind of "buckets" to collect elements into)
  # When we are done, concatenate the two linked lists together by setting the pointer of the first linked-list's tail to the head of the second linked-list.

def partition(head, x)
  smaller_current_node = nil
  larger_head = nil
  larger_current_node = nil
  current_node = head

  until current_node.nil?
    if current_node.value < x
      if smaller_current_node.nil?
        if larger_current_node.nil?
          head = current_node
        end
        smaller_current_node = current_node
        current_node = current_node.next
      else
        smaller_current_node.next = current_node
        current_node = current_node.next
      end
    else
      if larger_current_node.nil?
        if smaller_current_node.nil?
          head = current_node
        end
        larger_head = current_node
        larger_current_node = current_node
        current_node = current_node.next
      else
        larger_current_node.next = current_node
        current_node = current_node.next
      end
    end
  end

  smaller_current_node.next = larger_head

  head
end

# Time and space complexity:
  # Time: O(n). We must traverse through the entire linked list.
  # Space: O(n), as well. The two smaller LL lengths add up to the main linked list's length.
