# CTCI: Largest Stack

# You want to be able to access the largest element in a stack.
# Given that you already implemented this Stack class:

class Stack

  # initialize an empty array
  def initialize
      @items = []
  end

  # push a new item to the last index
  def push(item)
      @items.push(item)
  end

  # remove the last item
  def pop()
      # if the stack is empty, return nil
      # (it would also be reasonable to throw an exception)
      if @items.empty?
          return nil
      end
      return @items.pop()
  end

  # see what the last item is
  def peek()
      if @items.empty?
          return nil
      end
      return @items[-1]
  end
end

# Use your Stack class to implement a new class MaxStack with a function get_max() that returns the largest element in the stack. get_max() should not remove the item.
#
# Your stacks will contain only integers.

# Naive approach: Create a new stack to collect all of the elements from ourStack, and then retrieving the max using a greedy algorithm
# Less naive approach: Modify the pre-existing stack implementation so that whenever we add a new element, we check it against a variable called "current max"
  # Why this doesn't work: If the "current max" gets ejected from the stack, then we have no way of retrieving the next current max
  # FIX: Keep the "current max"s in a stack - and whenever we dequeue, we check if it's the top of the current max stack. If it is, then pop it off of the current max stack.
    # Now, we'll have the previous current max.

# Time complexity: O(1) to retrieve the max.
# Space complexity: Potentially O(n), since the max stack could hold as many elements as the real stack.

################# SECOND PASS

# You want to be able to access the largest element in a stack.
#
# Use your Stack class to implement a function `get_max()` that returns the largest element in the stack. `get_max()` should not remove the item.
#
# Your stacks will contain only integers.

# pseudocode:

# need a way to update the max whenever we add/remove an item
# the problem with just storing it in a variable is that we need to have had ALL of the previous maximums
# => store all of the maximums in a "stack"

class Stack

  # initialize an empty array
  def initialize
      @items = []
      @max_stack = []
  end

  # push a new item to the last index
  def push(item)
      @items.push(item)

      if @max_stack.empty?
        @max_stack.push(item)
      end

      if item > @max_stack.last
        @max_stack.push(item)
      end
  end

  # remove the last item
  def pop()
      # if the stack is empty, return nil
      # (it would also be reasonable to throw an exception)
      if @items.empty?
          return nil
      end

      if @max_stack.last == @items.last
        @max_stack.pop()
      end

      return @items.pop()
  end

  # see what the last item is
  def peek()
      if @items.empty?
          return nil
      end
      return @items[-1]
  end

  def get_max()
    @max_stack.last()
  end
end
