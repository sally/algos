class Queue < Array
  def enqueue(item)
    self.push(item)
  end

  def dequeue
    self.shift
  end

  def peek
    self[0]
  end
end

# version A:
  # stack is efficient when pushing an item: O(1)

class StackTwoQueues
  def initialize
    @in_queue = Queue.new
    @out_queue = Queue.new
  end

  def push(item)
    @in_queue.enqueue(item)
  end

  def pop
    while @in_queue.size > 1
      @out_queue.queue(@in_queue.dequeue)
    end

    item_to_return = @in_queue.dequeue

    @in_queue, @out_queue = @out_queue, @in_queue

    item_to_return
  end
end

# version B:
  # stack is efficient when popping an item: O(1)

class StackTwoQueues
  def initialize
    @in_queue = Queue.new
    @out_queue = Queue.new
  end

  def push(item)
    @in_queue.enqueue(item)

    while @out_queue.size > 1
      @in_queue.enqueue(@out_queue.dequeue)
    end

    @in_queue, @out_queue = @out_queue, @in_queue
  end

  def pop
    @out_queue.dequeue
  end
end
