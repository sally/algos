Get Started!

    1. Paste your code, then name it on the right, or drag & drop a file in.

    2. Share your link! (https://kobra.io/#/e/-KXhGqlcHBtsTUKYtPtI)


# CTCI: Sum Lists

# You have two numbers represented by a linked list, where each node contains a single digit. The digits are stored in reverse order, such that the 1's digit is at the head of the list. Write a function that adds the two numbers and returns the sum as a linked list.

# Example inputs: 7->1->6 + 5->9->2, which is 617+295
# Example output: 2->1->9, which is 912

# FOLLOW UP: Suppose the digits are stored in forward order, repeat the above problem.

##############

# Observation: Could possibly iterate through both linked lists, iterating through and storing the numbers they represent, carry out the regular addition, and return those values.
# Could there possibly be a way to eliminate the intermediary step of storing the numbers and carrying out the addition of possibly big numbers?

# ex. In regular addition, we have
#  617
# +295
# ----
#    2

#   1
#  617
# +295
# ----
#   12

#  1
#  617
# +295
# ----
#  912

# Where we just carry out smaller additions from the smaller digits to the larger digits- this kind of mirrors what we have here, since the 1's digit is at the head of the list, and those are the ones we have initial access to.

# Possible pseudocode:

# Look at 7->1->6, 5->9->2
# Add 7 and 5, get 12. Store 1 in another variable, and put 2 at the head of or linked list to return
# Add 1 and 9, get 10. Add 1 from the previous step, get 11. Store 1 in another variable, put 1 as the next
# Add 2 and 6, get 8. Add 1 from the previous step, get 9. Set overflow variable to 0, put 9 as the next.

# Edge cases:
    # If the two numbers are different lengths
    # Resolve by (as long as the overflow variable is 0), continuing down the longer linked list until it's exhausted

def sum_lists(head1, head2)
    # Initialize variables to hold data about the linked list to return
    sum_head = nil
    sum_current = nil

    head1_current = head1
    head2_current = head2

    overflow_num = 0

    until head1_current.nil? && head2_current.nil?
        current_sum = head1_current + head2_current
        overflow_num = max(0, current_sum - 10)
        # unfinished~ 11/30/16 at 2:35PM
        # current_sum =
    end
end
