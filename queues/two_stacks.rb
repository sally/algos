# IC: Implement a queue with two stacks. Your queue should have an enqueue and a dequeue function and it should be FIFO.

# Optimize for the time cost of m function calls on your queue. These can be any mix of enqueue and dequeue calls.

# Assume you already have a stack implementation and it gives O(1) time push and pop.

#########################################

class QueueOfStacks
  @@stack1 = []
  @@stack2 = []

  def enqueue(item)
    until @@stack2.empty?
      @@stack1.push(@@stack2.pop)
    end

    @@stack2.push(item)

    until @@stack1.empty?
      @@stack2.push(@@stack1.pop)
    end
  end

  def dequeue
    @@stack2.pop
  end
end

# Time complexity:
  # For m operations: our enqueue operation costs O(m), so for each m object, we have to do m operations - making our runtime O(m^2).

## BETTER: What if we didn't move things back to stack1 after putting them on stack2?

# Call our stacks in and out.
# For enqueue, we simply push the enqueued item onto in.
# To dequeue, since the oldest item is at the bottom of in_stack, we dig into the bottom of in_stack by pushing each item one-by-one onto out_stack until we reach the bottom item, which we return.
  # However, if there is already an item in the out_stack, we just pop off of the out stack.

  class QueueTwoStacks
  def initialize
      @in_stack  = []
      @out_stack = []
  end

  def enqueue(item)
      @in_stack.push(item)
  end

  def dequeue()
      if @out_stack.length == 0
          # Move items from in_stack to out_stack, reversing order
          while @in_stack.length > 0 do
              newest_in_stack_item = @in_stack.pop
              @out_stack.push(newest_in_stack_item)
          end
          # If out_stack is still empty, return nil
          if @out_stack.length == 0
              return nil
          end
      end
      return @out_stack.pop
  end
end
