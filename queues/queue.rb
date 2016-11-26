# A queue is like a line at the movie theatre. It's "first in, first out" (FIFO), which means that the item that was put in the queue longest ago is the first item that comes out.

# Queues have two main methods:
  # 1. enqueue(): adds an item
  # 2. dequeue(): removes and returns the next item in line

# They can also include some utility methods:
  # 1. peek() :returns the item at the front of the queue, without removing it
  # 2. is_empty(): returns True if the queue is empty. False otherwise

class QueueObj < Array
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
