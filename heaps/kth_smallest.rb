# Source: CTCI
#
# Find the kth smallest number in an array of size `N` with `O(N)` time complexity.

# pseudocode:
# initialize min-heapified-array
# iterate through array:
# for each value, say x:
  # insert it into the min-heapified array according to rules for inserting into a min heap (percolate up)
# extract min from min-heapified array k-1 times
# get min from min-heapified array and return it

def insert_into_min_heap(heap, element)
  heap << element
  current_index = heap.length

  while current_index > 1 && element < heap[(current_index / 2) - 1]
    larger_element = heap[(current_index / 2) - 1]

    heap[(current_index / 2) - 1] = element
    heap[current_index - 1] = larger_element

    current_index = (current_index / 2)
  end

  heap
end

def extract_min(heap)
  min_to_return = heap.shift

  heap.unshift(heap.pop)

  current_index = 1

  while !(heap[current_index*2 - 1].nil? && heap[current_index*2].nil?)
    if heap[current_index*2 - 1] && heap[current_index*2]
      if heap[current_index - 1] > heap[current_index*2 - 1] && heap[current_index*2 - 1] <= heap[current_index*2]
        index_to_swap_with = current_index*2 - 1
      elsif heap[current_index - 1] > heap[current_index*2] && heap[current_index*2 - 1] > heap[current_index*2]
        index_to_swap_with = current_index*2
      else
        break
      end
    elsif heap[current_index*2 - 1] && !heap[current_index*2] && heap[current_index - 1] > heap[current_index*2 - 1]
      index_to_swap_with = current_index*2 - 1
    elsif !heap[current_index*2 - 1] && heap[current_index*2] && heap[current_index - 1] > heap[current_index*2]
      index_to_swap_with = current_index*2
    else
      break
    end

    smaller_element = heap[index_to_swap_with]
    heap[index_to_swap_with] = heap[current_index - 1]
    heap[current_index - 1] = smaller_element

    current_index = index_to_swap_with + 1
  end

  min_to_return
end

def get_min(min_heap)
  min_heap.first
end

def get_kth_smallest(array, k)
  min_heapified_array = []

  array.each do |number|
    insert_into_min_heap(min_heapified_array, number)
  end

  p min_heapified_array

  (k-1).times do |num|
    extract_min(min_heapified_array)
    p min_heapified_array
  end

  get_min(min_heapified_array)
end

# driver code

insert_into_min_heap([15, 30, 40], 10)

min_heap = [1,5,6,13,12,11]

insert_into_min_heap(min_heap, 2)

extract_min(min_heap)

array = [6,7,9,3,4,1,6,2,10]

p get_kth_smallest(array, 1)
p get_kth_smallest(array, 2)
p get_kth_smallest(array, 3)
p get_kth_smallest(array, 4)
p get_kth_smallest(array, 5)

### big O analysis
## time complexity:
# note that inserting into the min heap takes O(logN) time, as does extracting from min heap.
# so, effectively, we are doing (at worst) 2logN + N operations - which is just O(N).
## space complexity:
# we build a heap of size N according to the input array, so it's also O(N)
