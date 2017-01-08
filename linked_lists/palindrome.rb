# Source: [GeeksForGeeks](http://www.practice.geeksforgeeks.org/problem-page.php?pid=700391)

# Given a singly linked list of integers, Your task is to complete a function that returns true if the given list is palindrome, else returns false.
#
# Input:
# The first line of input contains an integer T denoting the no of test cases. Then T testcases follow. Each test case contains 2 line the first line contains an integer N denoting the size of the linked list. In the next line are N space separated values of the nodes of the linked list.
#
# Output:
# For each test case output will be 1 if the linked list is a pallindrome else 0.

# pseudocode:
# initialize a stack to keep track of the first floor(n/2) elements in the linked list, where n is the given length
# depending on whether n is odd or even:
  # if n is odd, then let skip over the element in position floor(n/2) + 1
# continue iterating over the last floor(n/2) elements, popping off of the stack as we check for equality
  # if ever equality is not met, then return false
# if iteration is complete (and stack is empty?) return true

# Ruby Linked List Node Implementation:

class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end

end

def linked_list_palindrome(n, head)
  node_stack = []

  current_node = head

  for k in (0..n/2) do
    node_stack << current_node.value
    current_node = current_node.next
  end

  if n.odd?
    current_node = current_node.next
  end

  for k in (n/2+1...n) do
    if node_stack.last == current_node.value
      node_stack.pop
      current_node = current_node.next
    else
      false
    end
  end

  true
end

# big o analysis
# time complexity: O(n)
# space complexity: the stack we get grows to size n/2, so it is also O(n)
